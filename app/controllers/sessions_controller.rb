class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:request_url]
    else
      flash.now[:alert] = 'To login you should enter email and password!'
      render :new
    end
  end

  def exit
    redirect_to login_path
  end
end
