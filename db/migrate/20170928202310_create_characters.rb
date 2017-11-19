class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.references :user
      t.string :pseudo, null: false, default: ""
      t.string :server, null: false, default: ""
      t.string :category, null: false, default: ""
      t.string :role, null: true
      t.integer :level, null: false, default: 0

      t.timestamps
    end
  end
end
