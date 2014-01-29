class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.timestamps
    end
    add_index :users, :uid, unique: true
  end
end
