class AddDbIndexes < ActiveRecord::Migration
  def self.up
    add_index  :providers, :organization_id
    add_index  :providers, :task_status_id
    add_index  :environments, :organization_id
    add_index  :environment_priors, :environment_id
    add_index  :environment_priors, :prior_id
    add_index  :organizations, :task_id
    add_index  :products, :cp_id
    add_index  :products, :provider_id
    add_index  :products, :gpg_key_id
    add_index  :products, :sync_plan_id
    add_index  :permission_tags, :permission_id
    add_index  :permission_tags, :tag_id
    add_index  :changesets_products, :changeset_id
    add_index  :changesets_products, :product_id
    add_index  :help_tips, :user_id
    add_index  :users, :own_role_id
    add_index  :systems, :environment_id
    add_index  :user_notices, :user_id
    add_index  :user_notices, :notice_id
    add_index  :changeset_errata, :changeset_id
    add_index  :changeset_errata, :errata_id
    add_index  :changeset_errata, :product_id
    add_index  :sync_plans, :organization_id
    add_index  :changesets_repositories, :changeset_id
    add_index  :changesets_repositories, :repository_id
    add_index  :search_histories, :user_id
    add_index  :search_favorites, :user_id
    add_index  :changeset_users, :changeset_id
    add_index  :changeset_users, :user_id
    add_index  :products_system_templates, :system_template_id
    add_index  :products_system_templates, :product_id
    add_index  :changeset_packages, :changeset_id
    add_index  :changeset_packages, :package_id
    add_index  :changeset_packages, :product_id
    add_index  :changesets, :environment_id
    add_index  :changesets, :task_status_id
    add_index  :activation_keys, :organization_id
    add_index  :activation_keys, :environment_id
    add_index  :activation_keys, :system_template_id
    add_index  :changeset_distributions, :changeset_id
    add_index  :changeset_distributions, :distribution_id
    add_index  :changeset_distributions, :product_id
    add_index  :changesets_system_templates, :changeset_id
    add_index  :changesets_system_templates, :system_template_id
    add_index  :system_templates, :parent_id
    add_index  :system_templates, :environment_id
    add_index  :pools, :cp_id
    add_index  :key_pools, :activation_key_id
    add_index  :key_pools, :pool_id
    add_index  :changeset_dependencies, :changeset_id
    add_index  :changeset_dependencies, :package_id
    add_index  :changeset_dependencies, :product_id
    add_index  :system_template_distributions, :distribution_pulp_id
    add_index  :ldap_group_roles, :role_id
    add_index  :system_template_repositories, :system_template_id
    add_index  :system_template_repositories, :repository_id
    add_index  :repositories, :pulp_id
    add_index  :repositories, :environment_product_id
    add_index  :repositories, :gpg_key_id
    add_index  :repositories, :library_instance_id
    add_index  :key_system_groups, :activation_key_id
    add_index  :key_system_groups, :system_group_id
    add_index  :system_groups, :pulp_id
    add_index  :system_groups, :organization_id
    add_index  :system_system_groups, :system_id
    add_index  :system_system_groups, :system_group_id
    add_index  :environment_system_groups, :environment_id
    add_index  :environment_system_groups, :system_group_id
    add_index  :jobs, :job_owner_id
    add_index  :jobs, :pulp_id
    add_index  :job_tasks, :job_id
    add_index  :job_tasks, :task_status_id
    add_index  :task_statuses, :organization_id
    add_index  :task_statuses, :user_id
    add_index  :task_statuses, :task_owner_id
  end

  def self.down
    remove_index :providers, :column => :organization_id
    remove_index :providers, :column => :task_status_id
    remove_index :environments, :column => :organization_id
    remove_index :environment_priors, :column => :environment_id
    remove_index :environment_priors, :column => :prior_id
    remove_index :organizations, :column => :task_id
    remove_index :products, :column => :cp_id
    remove_index :products, :column => :provider_id
    remove_index :products, :column => :gpg_key_id
    remove_index :products, :column => :sync_plan_id
    remove_index :permission_tags, :column => :permission_id
    remove_index :permission_tags, :column => :tag_id
    remove_index :changesets_products, :column => :changeset_id
    remove_index :changesets_products, :column => :product_id
    remove_index :help_tips, :column => :user_id
    remove_index :users, :column => :own_role_id
    remove_index :systems, :column => :environment_id
    remove_index :user_notices, :column => :user_id
    remove_index :user_notices, :column => :notice_id
    remove_index :changeset_errata, :column => :changeset_id
    remove_index :changeset_errata, :column => :errata_id
    remove_index :changeset_errata, :column => :product_id
    remove_index :sync_plans, :column => :organization_id
    remove_index :changesets_repositories, :column => :changeset_id
    remove_index :changesets_repositories, :column => :repository_id
    remove_index :search_histories, :column => :user_id
    remove_index :search_favorites, :column => :user_id
    remove_index :changeset_users, :column => :changeset_id
    remove_index :changeset_users, :column => :user_id
    remove_index :products_system_templates, :column => :system_template_id
    remove_index :products_system_templates, :column => :product_id
    remove_index :changeset_packages, :column => :changeset_id
    remove_index :changeset_packages, :column => :package_id
    remove_index :changeset_packages, :column => :product_id
    remove_index :changesets, :column => :environment_id
    remove_index :changesets, :column => :task_status_id
    remove_index :activation_keys, :column => :organization_id
    remove_index :activation_keys, :column => :environment_id
    remove_index :activation_keys, :column => :system_template_id
    remove_index :changeset_distributions, :column => :changeset_id
    remove_index :changeset_distributions, :column => :distribution_id
    remove_index :changeset_distributions, :column => :product_id
    remove_index :changesets_system_templates, :column => :changeset_id
    remove_index :changesets_system_templates, :column => :system_template_id
    remove_index :system_templates, :column => :parent_id
    remove_index :system_templates, :column => :environment_id
    remove_index :pools, :column => :cp_id
    remove_index :key_pools, :column => :activation_key_id
    remove_index :key_pools, :column => :pool_id
    remove_index :changeset_dependencies, :column => :changeset_id
    remove_index :changeset_dependencies, :column => :package_id
    remove_index :changeset_dependencies, :column => :product_id
    remove_index :system_template_distributions, :column => :distribution_pulp_id
    remove_index :ldap_group_roles, :column => :role_id
    remove_index :system_template_repositories, :column => :system_template_id
    remove_index :system_template_repositories, :column => :repository_id
    remove_index :repositories, :column => :pulp_id
    remove_index :repositories, :column => :environment_product_id
    remove_index :repositories, :column => :gpg_key_id
    remove_index :repositories, :column => :library_instance_id
    remove_index :key_system_groups, :column => :activation_key_id
    remove_index :key_system_groups, :column => :system_group_id
    remove_index :system_groups, :column => :pulp_id
    remove_index :system_groups, :column => :organization_id
    remove_index :system_system_groups, :column => :system_id
    remove_index :system_system_groups, :column => :system_group_id
    remove_index :environment_system_groups, :column => :environment_id
    remove_index :environment_system_groups, :column => :system_group_id
    remove_index :jobs, :column => :job_owner_id
    remove_index :jobs, :column => :pulp_id
    remove_index :job_tasks, :column => :job_id
    remove_index :job_tasks, :column => :task_status_id
    remove_index :task_statuses, :column => :organization_id
    remove_index :task_statuses, :column => :user_id
    remove_index :task_statuses, :column => :task_owner_id
  end
end
