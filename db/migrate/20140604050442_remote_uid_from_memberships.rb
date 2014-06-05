class RemoteUidFromMemberships < ActiveRecord::Migration
  def change
    remove_column :memberships, :uid, :integer

    add_column :memberships, :user_id, :integer
  end
end
