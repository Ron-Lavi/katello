#
# Copyright 2011 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

require_dependency "resources/pulp"

module Glue::Pulp::User
  def self.included(base)
    base.send :include, InstanceMethods
    base.send :include, LazyAccessor
    base.class_eval do
      lazy_accessor :login, :password, :name, :initializer => lambda { Pulp::User.find(self.pulp_id) }

      before_save :save_pulp_orchestration
      before_destroy :destroy_pulp_orchestration
    end
  end

  module InstanceMethods

    def initialize(attrs = nil)
      attrs = attrs.reject do |k, v|
        !attributes_from_column_definition.keys.member?(k.to_s) && (!respond_to?(:"#{k.to_s}=") rescue true)
      end

      super(attrs)
    end

    def set_pulp_user
      created = Pulp::User.create(:login => self.username, :password => self.password)
      self.pulp_id = created[:id]
    rescue => e
      Rails.logger.error "Failed to create pulp user #{self.username}: #{e}, #{e.backtrace.join("\n")}"
      raise e
    end

    def del_pulp_user
      Pulp::User.destroy(self.pulp_id)
    rescue => e
      Rails.logger.error "Failed to delete pulp user #{self.username}: #{e}, #{e.backtrace.join("\n")}"
      raise e
    end

    def save_pulp_orchestration
      queue.create(:name => "create pulp user: #{self.username}", :priority => 3, :action => [self, :set_pulp_user])
    end

    def destroy_pulp_orchestration
      queue.create(:name => "delete pulp user: #{self.username}", :priority => 3, :action => [self, :del_pulp_user])
    end
  end
end