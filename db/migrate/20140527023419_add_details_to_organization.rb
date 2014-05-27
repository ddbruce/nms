class AddDetailsToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :title, :string
  end
end
