class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :is_active, :boolean
    add_column :users, :RIN, :int
    add_column :users, :avatar_id, :int
    add_column :users, :org_id, :int
    add_column :users, :year, :int
  end
end
