class AuthenticationsController < ApplicationController
  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth["provider"], omniauth["uid"])
    if authentication
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect(:user, authentication.user)
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully"
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end
  
  def failure
    flash[:notice] = "Falha na conexão com o serviço"
    redirect_to new_user_session_url
  end

  def inspect
    render :text => request.env["omniauth.auth"].to_yaml
  end
end
