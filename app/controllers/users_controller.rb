class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # raise @user.inspect
  end
end
