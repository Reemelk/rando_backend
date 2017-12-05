class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.bigint :user_leader, null: true

      t.string :name, null: false, default: ""

      t.integer :minp, null: false, default: 0
      t.integer :maxp, null: false, default: 8
      t.string :server, null: false, default: ""
      t.boolean :fight_type, null: false, default: false

      t.integer :levelp, null: false, default: 0
      t.integer :range, null: false, default: 10
      t.integer :levelpmin, null: false, default: 0
      t.integer :levelpmax, null: false, default: 200

      t.integer :organizations_count, null: false, default: 0

      t.integer :status, null: false, default: 0

      t.timestamps
    end
    add_index :groups, :status
  end
end
