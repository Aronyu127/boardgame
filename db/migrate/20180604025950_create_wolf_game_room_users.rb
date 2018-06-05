class CreateWolfGameRoomUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :wolf_game_room_users do |t|
      t.integer :game_room_id
      t.integer :user_id
      t.integer :initial_role_id
      t.integer :finial_role_id
      t.hstore  :revealing_data
      t.integer :status
      t.timestamps
    end
  end
end
