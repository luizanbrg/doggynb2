class AddParamsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :password, :string
    add_column :users, :city, :string
  end
end
