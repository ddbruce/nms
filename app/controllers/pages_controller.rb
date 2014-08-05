class PagesController < ApplicationController

  # Home page - show latest articles
  def index
    @articles = Article.all.order("updated_at desc").limit(6)
  end

end
