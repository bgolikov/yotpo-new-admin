class CreateAdminUsersRoles < ActiveRecord::Migration
  def change
    create_table :admin_users_roles do |t|
      t.integer :admin_user_id, null: false, default: 0
      t.integer :role_id, null: false, default: 0

      t.timestamps
    end
      add_foreign_key :admin_users_roles, :admin_users
      add_foreign_key :admin_users_roles, :roles
      add_index :admin_users_roles, [:admin_user_id, :role_id], unique: true
  end
end
