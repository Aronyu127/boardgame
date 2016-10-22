class CreateGameRooms < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'hstore'
    create_table :game_rooms do |t|
      t.string :name
      t.integer :owner_id
      t.integer :game_id
      t.integer :status
      t.integer :limit_player
      t.hstore  :data
      t.timestamps
    end
    add_index :game_rooms, :owner_id
    add_index :game_rooms, :game_id
  end
end
