class CreateSpyGameRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :spy_game_roles do |t|
      t.string :name
      t.string :place
    end
  end
end
