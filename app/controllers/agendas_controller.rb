class AgendasController < ApplicationController
  before_filter :authenticate
  
  # GET /agendas
  # GET /agendas.xml
  def index
    @agendas = Agenda.all(:conditions => { :user_id => current_user.id })

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agendas }
    end
  end

  # GET /agendas/1
  # GET /agendas/1.xml
  def show
    @agenda = Agenda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agenda }
    end
  end

  # GET /agendas/new
  # GET /agendas/new.xml
  def new
    @agenda = Agenda.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agenda }
    end
  end

  # GET /agendas/1/edit
  def edit
    @agenda = Agenda.find(params[:id])
  end

  # POST /agendas
  # POST /agendas.xml
  def create
    @agenda = Agenda.new(params[:agenda])
    @agenda.user = current_user

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

  # PUT /agendas/1
  # PUT /agendas/1.xml
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

  # DELETE /agendas/1
  # DELETE /agendas/1.xml
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
