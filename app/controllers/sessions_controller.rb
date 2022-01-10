class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:url_before_login) || tests_path
    else
      flash.now[:alert] = 'To login you should enter email and password!'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
