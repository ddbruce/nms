class AddDetailsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :head, :text
    add_column :articles, :body, :text
    add_column :articles, :subhead, :text
    add_column :articles, :section, :string
    add_column :articles, :section_id, :integer
  end
end
