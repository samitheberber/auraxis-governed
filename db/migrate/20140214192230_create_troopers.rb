class CreateTroopers < ActiveRecord::Migration
  def change
    create_table :troopers do |t|
      t.integer :mission_id
      t.integer :character_id

      t.timestamps

      t.foreign_key :missions
      t.foreign_key :characters
    end
  end
end
