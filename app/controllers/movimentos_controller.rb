class MovimentosController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @movimento = Movimento.new(params[:movimento])

    respond_to do |format|
      if @movimento.save
        flash[:notice] = 'Movimento cadastrado com sucesso.'
        format.html { redirect_to(@movimento.conta) }
        format.xml  { render :xml => @movimento, :status => :created, :location => @movimento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movimento.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @movimento = Movimento.find(params[:id])
  end
  
  def update
    @movimento = Movimento.find(params[:id])

    respond_to do |format|
      if @movimento.update_attributes(params[:movimento])
        flash[:notice] = 'Movimento atualizado com sucesso.'
        format.html { redirect_to(@movimento.conta) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movimento.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new
    @movimento = Movimento.new
    @movimento.dia = Date.today
    if params[:conta_id] != nil
      @movimento.conta_id = params[:conta_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movimento }
    end
  end
  
  def destroy
    @movimento = Movimento.find(params[:id])
    
    conta_atual = Conta.find(@movimento.conta.id)
    
    @movimento.destroy

    respond_to do |format|
      flash[:notice] = 'Movimento removido com sucesso.'
      format.html { redirect_to(conta_atual) }
      format.xml  { head :ok }
    end
  end
end
