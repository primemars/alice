class ArticlesController < ApplicationController

  def create
    # article = Article.create(params[:article])
    # percentage = article.grade
    # @text = "#{article.filename}: #{percentage}%"
    @text ='aca'
    respond_to do |format|
      #format.html {render :text => @text}
      format.js
    end

  end
end
