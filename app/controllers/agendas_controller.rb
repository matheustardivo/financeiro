class AgendasController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @agendas = Agenda.all(:order => 'mes desc', :conditions => { :user_id => current_user.id })

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agendas }
    end
  end

  def show
    @agenda = Agenda.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @agenda }
    end
  end
  
  def template
    @agenda = Agenda.find(params[:agenda_id])
    render @agenda
  end

  def new
    @agenda = Agenda.new
    @agenda.mes = Date.today

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agenda }
    end
  end

  def edit
    @agenda = Agenda.find(params[:id])
  end

  def create
    @agenda = Agenda.new(params[:agenda])
    @agenda.user = current_user
    
    unless params[:pagamento].empty?
      params[:pagamento].each do |pagamento|
        p = Pagamento.find(pagamento)
        novo_pagamento = Pagamento.new(
          :nome => p.nome, 
          :descricao => p.descricao, 
          :vencimento => Date.new(@agenda.mes.year, @agenda.mes.month, p.vencimento.day), 
          :valor => p.valor, 
          :user => p.user)

        @agenda.pagamentos << novo_pagamento
      end
    end
    
    respond_to do |format|
      if @agenda.save
        flash[:notice] = 'Agenda cadastrada com sucesso.';
        format.html { redirect_to(@agenda) }
        format.xml  { render :xml => @agenda, :status => :created, :location => @agenda }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agenda.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @agenda = Agenda.find(params[:id])

    respond_to do |format|
      if @agenda.update_attributes(params[:agenda])
        flash[:notice] = 'Agenda atualizada com sucesso.';
        format.html { redirect_to(@agenda) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agenda.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @agenda = Agenda.find(params[:id])
    
    if @agenda.pagamentos.empty?
      @agenda.destroy
      flash[:notice] = 'Agenda removida com sucesso.'
    else
      flash[:notice] = 'Agenda não pode ser removida por possuir pagamentos associados.'
    end

    respond_to do |format|
      format.html { redirect_to(agendas_url) }
      format.xml  { head :ok }
    end
  end
end
