class AddDetailsToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :uid, :integer
    add_column :memberships, :org_id, :integer
    add_column :memberships, :pos_id, :integer
  end
end
