class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @article = Article.new
    @active_find = true
  end
end
