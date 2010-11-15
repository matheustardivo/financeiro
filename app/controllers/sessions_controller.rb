class SessionsController < Devise::SessionsController
  def destroy
    super
    session[:omniauth] = nil
  end
end
