class ChangeArticleColumns < ActiveRecord::Migration
  def change
    rename_column :articles, :head, :headline
    rename_column :articles, :subhead, :deck
    rename_column :articles, :body, :bodytext
  end
end
