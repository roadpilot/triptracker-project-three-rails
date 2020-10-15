class SessionsController < ApplicationController
    def new
        # nothing to do here!
    end
 
    def create
        @user = User.find_by(handle: params[:user][:handle])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
    end

    def destroy
      session.delete :user_id
      redirect_to '/'
    end
end