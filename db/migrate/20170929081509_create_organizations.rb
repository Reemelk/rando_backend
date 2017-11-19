class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.references :user, index: true, foreign_key: true, unique: true
      t.references :group, index: true, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
