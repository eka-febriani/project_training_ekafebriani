class ArticlesController < ApplicationController
  before_filter :find_article, :only => [:show, :edit, :update, :destroy]
  before_filter :able_edit_delete_article?, :only => [:edit, :destroy, :update]


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:category])
    if @article.save
       flash[:notice] = 'Create article success'
       redirect_to articles_path
    else
      render :action => :new
    end
  end
  
  def show
  end
  
  def index
    @articles = Article.all
    if @articles.nil?
      flash[:notice] = "No article found"
    end
  end

  def edit
  end

  def update
    @article.user_id = current_user.id
    if @article.update_attributes(params[:article])
      flash[:notice] = 'updated successfully'
      redirect_to articles_path
    else
      render :action => :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    def find_article
      @article = Article.find_by_id(params[:id])
    end

    def able_edit_delete_article?
      unless(current_user.is_admin? || @article.user_id == current_user.id)
        flash[:notice] = 'Have no autorize to do this!'
        redirect_to articles_path
      end
    end

end
