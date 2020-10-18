class SessionsController < ApplicationController

    # ROOT STARTS AT LOGIN SCREEN
    def new
        if !session[:user_id].nil? 
            redirect_to user_path(current_user)
        else
            render :new
        end
    end
 
    # CREATE NEW SESSION FROM LOGIN PARAMS OR FROM OMNIAUTH
    def create
      if auth
        email = auth['info']['email']
        email = "#{auth['info']['nickname']}@github" if email.nil?
        @user = User.find_or_create_by(handle: auth[:info][:nickname]) do |u|
          u.email = email
          u.password = auth['uid']
        end
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
      else
        @user = User.find_by(handle: params[:user][:handle])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
        else
          flash[:error] = "Sorry, your username or password was incorrect"
          redirect_to '/login'
        end
      end
    end

    # LOGOUT AND SEND BACK TO LOGIN SCREEN
    def destroy
      session.delete :user_id
      redirect_to '/'
    end

  private
  # METHOD FOR OMNIAUTH VARIABLES
  def auth
    request.env['omniauth.auth']
  end

end