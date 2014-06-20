class CreateNmsConfigs < ActiveRecord::Migration
  def change
    create_table :nms_configs do |t|

      t.timestamps
    end
  end
end
