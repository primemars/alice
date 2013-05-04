class WelcomeController < ApplicationController
  def index
    @article = Article.new
    @active_find = true
  end
end
