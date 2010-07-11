class FaturasController < ApplicationController
  # GET /faturas
  # GET /faturas.xml
  def index
    @faturas = Fatura.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @faturas }
    end
  end

  # GET /faturas/1
  # GET /faturas/1.xml
  def show
    @fatura = Fatura.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fatura }
    end
  end

  # GET /faturas/new
  # GET /faturas/new.xml
  def new
    @fatura = Fatura.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fatura }
    end
  end

  # GET /faturas/1/edit
  def edit
    @fatura = Fatura.find(params[:id])
  end

  # POST /faturas
  # POST /faturas.xml
  def create
    @fatura = Fatura.new(params[:fatura])

    respond_to do |format|
      if @fatura.save
        format.html { redirect_to(@fatura, :notice => 'Fatura was successfully created.') }
        format.xml  { render :xml => @fatura, :status => :created, :location => @fatura }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fatura.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /faturas/1
  # PUT /faturas/1.xml
  def update
    @fatura = Fatura.find(params[:id])

    respond_to do |format|
      if @fatura.update_attributes(params[:fatura])
        format.html { redirect_to(@fatura, :notice => 'Fatura was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fatura.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /faturas/1
  # DELETE /faturas/1.xml
  def destroy
    @fatura = Fatura.find(params[:id])
    @fatura.destroy

    respond_to do |format|
      format.html { redirect_to(faturas_url) }
      format.xml  { head :ok }
    end
  end
  
  def fechar
    
  end
end
