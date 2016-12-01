class AddColumnToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :data, :hstore
  end

  def down
    remove_column :users, :name, :string
    remove_column :users, :avatar, :string
    remove_column :users, :data, :hstore
  end
end
