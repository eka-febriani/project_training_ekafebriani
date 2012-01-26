class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    if @user.nil?
      flash[:error] = "User Not Found"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if verify_recaptcha
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        #redirect_to root_url, :notice => "Signed up!"
      else
        render "new"
      end
    else
    flash[:error] = "There was an error with the recaptcha code below.
                     Please re-enter the code and click submit."
    render "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = 'updated successfully'
      redirect_to user_path
    else
      render :action => :edit
    end 
  end

end
