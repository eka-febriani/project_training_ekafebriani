class CommentsController < ApplicationController

  def new
    @comment = Comment.all
  end

  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
         @article = Article.find(@comment.article_id)
         @comments = @article.comments
         format.html { redirect_to(article_path(@comment.article_id), :notice => 'Comment was successfully created.')}
         format.js
      else
         format.html { redirect_to(article_path(@comment.article_id), :notice => 'Comment create failed.')}
      end
    end
  end

end
