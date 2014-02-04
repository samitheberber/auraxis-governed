class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.string :status
      t.integer :user_id
      t.string :server
      t.string :faction

      t.timestamps

      t.foreign_key :users
    end
  end
end
