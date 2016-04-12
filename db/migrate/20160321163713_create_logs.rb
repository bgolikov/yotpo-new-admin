class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :activity_type_id, null: false, foreign_key: true
      t.integer :admin_user_id, null: false
      t.string :app_key, defualt: nil, index: true

      t.timestamps
    end
      add_foreign_key :logs, :activity_types
      add_foreign_key :logs, :admin_users
      add_index :logs, :created_at
  end
end
