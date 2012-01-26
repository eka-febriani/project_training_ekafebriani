class Admin::CategoriesController < Admin::ApplicationController

  before_filter :find_category, :only => [:show, :edit, :update, :destroy]
  #before_filter :require_admin_login

  def show
  end

  def new
    @parent_category = Category.where(["parent_id IS NULL"]).map{|x| [x.id, x.name]}
    #parent_category is not select belum ditangani
    #parent_category be id belum ditangani
    @category = Category.new
  end

  def edit
   @parent_category = Category.where(["parent_id IS NULL"]).map{|x| [x.name, x.id]}
  end
  
  def create
   @category = Category.new(params[:category])
    if @category.save
       flash[:notice] = 'Create category success'
       redirect_to admin_categories_path
    else
      render :action => :new
    end
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = 'updated successfully'
      redirect_to admin_categories_path
    else
      render :action => :edit
    end 
  end
  
  def index
    @categories = Category.all
    if @categories.nil?
      flash[:notice] = "No category found"
    end
#    if (Category.parent_category.nil?)
#      @parent_category = '-'
#    else
#      @parent_category = Category.parent_category
#    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private
    def find_category
      @category = Category.find_by_id(params[:id])
    end

end
