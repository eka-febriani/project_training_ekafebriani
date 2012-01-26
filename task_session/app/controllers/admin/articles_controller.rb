class Admin::ArticlesController < Admin::ApplicationController
  before_filter :require_admin_login
  before_filter :find_article, :only => [:edit, :update, :destroy]
  before_filter :able_edit_delete_article?, :only => [:edit, :update, :destroy]


  def show
    @comments = @article.comments
    @comment = Comment.new
  end


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
       flash[:notice] = 'Create article success'
       redirect_to admin_articles_path
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(params[:article])
      flash[:notice] = 'updated successfully'
      redirect_to admin_articles_path
    else
      render :action => :edit
    end 
  end
  
  def destroy
    @article.destroy
    redirect_to admin_articles_path
  end

  def index
    @articles = Article.all
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
