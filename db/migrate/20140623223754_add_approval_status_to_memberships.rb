class AddApprovalStatusToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :approval_status, :integer, default: 0
  end
end
