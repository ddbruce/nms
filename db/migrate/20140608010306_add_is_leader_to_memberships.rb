class AddIsLeaderToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :is_leader, :boolean, null: false, default: false
  end
end
