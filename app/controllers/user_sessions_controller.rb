class UserSessionsController < ApplicationController
  def login
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login realizado com sucesso."
      redirect_to root_url
    else
      render :action => 'login'
    end
  end
  
  def logout
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Logout realizado com sucesso."
    redirect_to root_url
  end
end
