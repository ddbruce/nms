class PagesController < ApplicationController

  def index
    @articles = Article.all.order("updated_at desc").limit(5)
  end

end
