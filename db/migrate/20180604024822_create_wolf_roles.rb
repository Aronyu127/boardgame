class CreateWolfRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :wolf_roles do |t|
      t.string :name
      t.integer :order
      t.timestamps
    end
  end
end
