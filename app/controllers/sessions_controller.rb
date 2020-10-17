class SessionsController < ApplicationController
    def new
        # nothing to do here!
        if !session[:user_id].nil? 
            redirect_to user_path(current_user)
        else
            render :new
        end
    end
 
    def create
        # @user = User.find_by(handle: params[:user][:handle])
        # return head(:forbidden) unless @user.authenticate(params[:user][:password])
        # session[:user_id] = @user.id
        # binding.pry
    @user = User.find_or_create_by(handle: auth[:info][:nickname]) do |u|
      u.email = auth['info']['email']
    end
    # binding.pry
    session[:user_id] = @user.id

    redirect_to "/users/#{@user.id}"
  end

    def destroy
      session.delete :user_id
      redirect_to '/'
    end
  private

  def auth
    request.env['omniauth.auth']
  end

end