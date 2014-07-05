class AddTypeToMediaTypes < ActiveRecord::Migration
  def change
    add_column :media_types, :type_name, :string
  end
end
