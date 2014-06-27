class AddAuthorsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :integer
    add_column :articles, :organization_id, :integer
  end
end
