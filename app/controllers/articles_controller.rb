class ArticlesController < ApplicationController

  def create
    @article = Article.create(params[:article]).grade
    respond_to do |format|
      format.js {render :layout => false}
    end

  end
end
