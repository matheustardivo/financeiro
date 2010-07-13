class FaturasController < ApplicationController
  before_filter :authenticate
  
  def show
    @fatura = Fatura.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fatura }
    end
  end
  
  def fechar
    
  end
end
