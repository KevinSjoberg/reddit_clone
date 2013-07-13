class SessionsController < ApplicationController
  def create
    if user = UserAuthenticator.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login successfully"
    else
      render :new
    end
  end
end
