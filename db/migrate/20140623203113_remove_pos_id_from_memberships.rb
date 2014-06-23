class RemovePosIdFromMemberships < ActiveRecord::Migration
  def change
    remove_column :memberships, :pos_id, :integer

    add_column :memberships, :position_id, :integer
  end
end
