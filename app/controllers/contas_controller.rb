class ContasController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /contas
  # GET /contas.xml
  def index
    @contas = Conta.all(:conditions => { :user_id => current_user.id })

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contas }
    end
  end

  # GET /contas/1
  # GET /contas/1.xml
  def show
    @conta = Conta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @conta }
    end
  end

  # GET /contas/new
  # GET /contas/new.xml
  def new
    @conta = Conta.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @conta }
    end
  end

  # GET /contas/1/edit
  def edit
    @conta = Conta.find(params[:id])
  end

  # POST /contas
  # POST /contas.xml
  def create
    @conta = Conta.new(params[:conta])
    @conta.user = current_user

    respond_to do |format|
      if @conta.save
        flash[:notice] = 'Conta cadastrada com sucesso.'
        format.html { redirect_to(@conta) }
        format.xml  { render :xml => @conta, :status => :created, :location => @conta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @conta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contas/1
  # PUT /contas/1.xml
  def update
    @conta = Conta.find(params[:id])

    respond_to do |format|
      if @conta.update_attributes(params[:conta])
        flash[:notice] = 'Conta atualizada com sucesso.'
        format.html { redirect_to(@conta) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @conta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contas/1
  # DELETE /contas/1.xml
  def destroy
    @conta = Conta.find(params[:id])
    
    if @conta.movimentos.empty?
      @conta.destroy
      flash[:notice] = 'Conta removida com sucesso.'
    else
      flash[:notice] = 'Conta não pode ser removida por possuir movimentações associadas.'
    end

    respond_to do |format|
      format.html { redirect_to(contas_url) }
      format.xml  { head :ok }
    end
  end
  
  def dashboard
    @contas = Conta.all(:conditions => { :user_id => current_user.id })
  end
end
