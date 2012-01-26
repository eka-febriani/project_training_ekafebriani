class ProductsController < ApplicationController
  before_filter :able_edit_delete_product?, :only => [:edit, :destroy, :update]
  before_filter :find_article, :only => [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
       flash[:notice] = 'Create product success'
       redirect_to products_path
    else
      render :action => :new
    end
  end

  def index
    @products = Product.all
    if @products.nil?
      flash[:notice] = "No product found"
    end 
   # @articles = @products.comments
  end
  
  def show
  end

  def edit
  end

  def update
    @product.user_id = current_user.id
    if @product.update_attributes(params[:product])
      flash[:notice] = 'updated successfully'
      redirect_to products_path
    else
      render :action => :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to categories_path
  end

  private
    def find_product
      @product = Product.find_by_id(params[:id])
    end

    def able_edit_delete_products?
     unless(current_user.is_admin? || @product.user_id == current_user.id)
       flash[:notice] = 'Have no autorize to do this!'
       redirect_to products_path
     end
    end

end
