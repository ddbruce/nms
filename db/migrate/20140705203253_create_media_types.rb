class CreateMediaTypes < ActiveRecord::Migration
  def change
    create_table :media_types do |t|
      t.timestamps
    end
  end
end
