class PagamentosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if params[:ordenar] == 'confirmado'
      @pagamentos = Pagamento.all(:order => "confirmado DESC", :conditions => { :user_id => current_user.id })
    else
      @pagamentos = Pagamento.all(:order => "vencimento DESC", :conditions => { :user_id => current_user.id })
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pagamentos }
    end
  end

  def new
    if params[:agenda_id] == nil
      flash[:notice] = 'Agenda não encontrada.'
      redirect_to :back
    end
    
    @pagamento = Pagamento.new
    @pagamento.agenda = Agenda.find(params[:agenda_id])
    @pagamento.vencimento = Date.today

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pagamento }
    end
  end

  def edit
    @pagamento = Pagamento.find(params[:id])
  end

  def create
    @pagamento = Pagamento.new(params[:pagamento])
    @pagamento.user = current_user

    respond_to do |format|
      if @pagamento.save
        flash[:notice] = 'Pagamento cadastrado com sucesso.'
        format.html { redirect_to(@pagamento.agenda) }
        format.xml  { render :xml => @pagamento, :status => :created, :location => @pagamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      if @pagamento.update_attributes(params[:pagamento])
        flash[:notice] = 'Pagamento atualizado com sucesso.'
        format.html { redirect_to(@pagamento.agenda) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @pagamento = Pagamento.find(params[:id])
    
    agenda_atual = Agenda.find(@pagamento.agenda.id)
    
    @pagamento.destroy

    respond_to do |format|
      flash[:notice] = 'Pagamento removido com sucesso.'
      format.html { redirect_to(agenda_atual) }
      format.xml  { head :ok }
    end
  end
  
  def confirmar
    @pagamento = Pagamento.find(params[:id])
    @pagamento.confirmado = true
    @pagamento.save
    
    respond_to do |format|
      format.js { render "confirmar" }
    end
  end
  
  def cancelar
    @pagamento = Pagamento.find(params[:id])
    @pagamento.confirmado = false
    @pagamento.save
    
    respond_to do |format|
      format.js { render "confirmar" }
    end
  end
end
