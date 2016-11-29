class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :dob, :string
    add_column :users, :location, :string
  end
end
