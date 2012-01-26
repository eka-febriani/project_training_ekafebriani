class UsersController < ApplicationController
 # before_filter :require_login, :only => [:new, :create, :edit, :update]

  def new 
    @user = User.new 
  end 

  def create 
    @user = User.new(params[:user])
    if verify_recaptcha
      respond_to do |format|
        if @user.save
          UserMailer.registration_confirmation(@user).deliver
          format.html { redirect_to(@user, :notice => 'User was successfully created.')}
          format.xml { render :xml => @user, :status => created, :location => @user }
          #redirect_to root_url, :notice => "Signed up!" 
        else
          format.html { render :action => "new" }
          format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
          #render "new" 
        end
      end
    else
      flash[:error] = "There was an error with the recaptcha code below.
Please re-enter the code and click submit"
      render "new" 
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = 'updated successfully'
      redirect_to _path
    else
      render :action => :edit
    end 
  end

end
