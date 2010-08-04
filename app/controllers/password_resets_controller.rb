class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  
  def new
    render
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "As instruções para resetar sua senha foram enviadas para seu email."
      redirect_to root_url
    else
      flash[:notice] = "Nenhum usuário encontrado com o email informado."
      render :action => :new
    end
  end
  
  def edit
    render
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Senha atualizada com sucesso."
      redirect_to root_url
    else
      render :action => :edit
    end
  end
  
  private
  
  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:notice] = "Desculpe-nos, mas não encontramos a sua solicitação."
      redirect_to root_url
    end
  end
end
