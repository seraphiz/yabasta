class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :birthdate, :date
    add_column :users, :genre, :string
    add_column :users, :active, :boolean, default: true
    add_column :users, :role, :integer, default: 1
    add_reference :users, :asignation_user_group, foreign_key: true
  end
end
