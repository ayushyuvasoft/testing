class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :mobilenum, :string
    add_column :users, :address, :string
  end
end
