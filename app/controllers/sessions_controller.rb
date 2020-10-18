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
      # binding.pry
      if auth
        @user = User.find_or_create_by(handle: auth[:info][:nickname]) do |u|
          u.email = auth['info']['email']
        end
      else
        @user = User.find_by(handle: params[:user][:handle])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
      end
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