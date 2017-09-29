class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
      t.integer :package_id
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
