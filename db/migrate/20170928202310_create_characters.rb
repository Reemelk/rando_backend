class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string, :pseudo, null: false, default: ""
      t.string, :role, null: false, default: ""
      t.string, :class, null: false, default: ""
      t.integer, :level, null: false, default: 0

      t.timestamps
    end
  end
end
