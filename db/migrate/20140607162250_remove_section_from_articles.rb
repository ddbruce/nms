class RemoveSectionFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :section, :string
  end
end
