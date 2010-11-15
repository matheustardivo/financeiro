class RegistrationsController < Devise::RegistrationsController
  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end
  
  def edit
    if current_user.authentication
      flash[:notice] = "Usuário autenticado pelo serviço #{current_user.authentication.provider}"
      redirect_to root_url
      return
    end
    
    super
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
end
