class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # raise @user.inspect
  end
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      # binding.pry
      session[:user_id] = @user.id
      current_user = @user
      redirect_to user_path(@user)
    else
      flash[:error] = "User signup failed: #{@user.errors.full_messages.to_sentence}"
      redirect_to '/users/new' 
    end
  end

  private
  def user_params
    params.require(:user).permit(:handle, :email, :password)
  end

end
