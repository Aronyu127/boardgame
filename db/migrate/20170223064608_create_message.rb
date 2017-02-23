class CreateMessage < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :game_room_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
