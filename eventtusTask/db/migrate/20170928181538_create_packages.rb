class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name, :null => false
      t.string :os, :null => false
      t.timestamps null: false
    end
  end
end
