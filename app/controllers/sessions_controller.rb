class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'E-mail ou senha incorretos'
      render 'new'
    end
  end

  def destroy
    log_out
    flash.now[:success] = 'Você foi deslogado'
    redirect_to root_url
  end
end
