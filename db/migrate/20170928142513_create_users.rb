class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string, :email, null: false, default: ""
      t.string, :encrypted_password, null: false, default: ""
      t.string, :username, null: false, default: ""

      t.boolean, :unsubscribe, null: false, default: false

      t.boolean, :ban, null: false, default: false
      t.datetime, :ban_until, default: nil

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
