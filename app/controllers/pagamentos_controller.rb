class PagamentosController < ApplicationController
  before_filter :authenticate
  
  # GET /pagamentos
  # GET /pagamentos.xml
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

  # GET /pagamentos/1
  # GET /pagamentos/1.xml
  def show
    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pagamento }
    end
  end

  # GET /pagamentos/new
  # GET /pagamentos/new.xml
  def new
    @pagamento = Pagamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pagamento }
    end
  end

  # GET /pagamentos/1/edit
  def edit
    @pagamento = Pagamento.find(params[:id])
  end

  # POST /pagamentos
  # POST /pagamentos.xml
  def create
    @pagamento = Pagamento.new(params[:pagamento])
    @pagamento.user = current_user

    respond_to do |format|
      if @pagamento.save
        flash[:notice] = 'Pagamento cadastrado com sucesso.'
        format.html { redirect_to(pagamentos_path) }
        format.xml  { render :xml => @pagamento, :status => :created, :location => @pagamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pagamentos/1
  # PUT /pagamentos/1.xml
  def update
    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      if @pagamento.update_attributes(params[:pagamento])
        flash[:notice] = 'Pagamento atualizado com sucesso.'
        format.html { redirect_to(pagamentos_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pagamentos/1
  # DELETE /pagamentos/1.xml
  def destroy
    @pagamento = Pagamento.find(params[:id])
    @pagamento.destroy
    flash[:notice] = 'Pagamento removido com sucesso.'

    respond_to do |format|
      format.html { redirect_to(pagamentos_url) }
      format.xml  { head :ok }
    end
  end
end
