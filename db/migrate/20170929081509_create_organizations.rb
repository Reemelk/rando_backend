class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.belongs_to, :user, index: true
      t.belongs_to, :group, index: true
      t.datetime, :organizations_date
      
      t.timestamps
    end
  end
end
