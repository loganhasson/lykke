class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :image, :string
    add_column :users, :description, :text
    add_column :users, :location, :string
    add_column :users, :token, :string
    add_column :users, :gender, :string
  end
end
