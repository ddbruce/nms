class AddDeviseColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :string
    add_column :users, :remember_me, :string
    add_column :users, :encrypted_password, :string
  end
end
