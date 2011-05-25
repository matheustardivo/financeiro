class FaturasController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @fatura = Fatura.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fatura }
    end
  end
  
  def fechar
    @fatura = Fatura.find(params[:id])
    
    unless @fatura.situacao == 'Aberta'
      flash[:notice] = 'Apenas faturas com situação Aberta podem ser fechadas.'
      redirect_to(@fatura)
      return
    end
    
    proxima_fatura = @fatura.proxima_fatura
    proxima_fatura.situacao = 'Aberta'
    proxima_fatura.save
    
    @fatura.situacao = 'Fechada'
    @fatura.save
    
    flash[:notice] = 'Fatura atual fechada com sucesso.'
    redirect_to(@fatura)
  end
  
  def confirmar
    @fatura = Fatura.find(params[:id])
    @fatura.confirmado = true
    @fatura.save
    
    respond_to do |format|
      format.js { render "confirmar" }
    end
  end
  
  def cancelar
    @fatura = Fatura.find(params[:id])
    @fatura.confirmado = false
    @fatura.save
    
    respond_to do |format|
      format.js { render "confirmar" }
    end
  end
end
