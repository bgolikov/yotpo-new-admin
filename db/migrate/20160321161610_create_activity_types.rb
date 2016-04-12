class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.string :name, null: false, uniqueness: true

      t.timestamps
    end
  end
end
