class CartaosController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /cartaos
  # GET /cartaos.xml
  def index
    @cartaos = Cartao.all(:conditions => { :user_id => current_user.id })

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cartaos }
    end
  end

  # GET /cartaos/1
  # GET /cartaos/1.xml
  def show
    @cartao = Cartao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cartao }
    end
  end

  # GET /cartaos/new
  # GET /cartaos/new.xml
  def new
    @cartao = Cartao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cartao }
    end
  end

  # GET /cartaos/1/edit
  def edit
    @cartao = Cartao.find(params[:id])
  end

  # POST /cartaos
  # POST /cartaos.xml
  def create
    @cartao = Cartao.new(params[:cartao])
    @cartao.user = current_user

    respond_to do |format|
      if @cartao.save
        flash[:notice] = 'Cartão cadastrado com sucesso.'
        
        # Criar uma nova fatura
        fatura = Fatura.new
        fatura.cartao = @cartao
        fatura.mes = Date.new(Date.today.year, Date.today.month)
        fatura.situacao = "Aberta"
        fatura.save
        
        format.html { redirect_to(@cartao) }
        format.xml  { render :xml => @cartao, :status => :created, :location => @cartao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cartao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cartaos/1
  # PUT /cartaos/1.xml
  def update
    @cartao = Cartao.find(params[:id])

    respond_to do |format|
      if @cartao.update_attributes(params[:cartao])
        flash[:notice] = 'Cartão atualizado com sucesso.'
        format.html { redirect_to(@cartao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cartao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cartaos/1
  # DELETE /cartaos/1.xml
  def destroy
    @cartao = Cartao.find(params[:id])
    if @cartao.faturas.empty?
      @cartao.destroy
    else
      flash[:notice] = 'Cartão não pode ser removido por possuir faturas associadas.'
    end

    respond_to do |format|
      format.html { redirect_to(cartaos_url) }
      format.xml  { head :ok }
    end
  end
end
