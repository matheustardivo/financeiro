class TiposController < ApplicationController
  # GET /tipos
  # GET /tipos.xml
  def index
    @tipos = Tipo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipos }
    end
  end

  # GET /tipos/1
  # GET /tipos/1.xml
  def show
    @tipo = Tipo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo }
    end
  end

  # GET /tipos/new
  # GET /tipos/new.xml
  def new
    @tipo = Tipo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo }
    end
  end

  # GET /tipos/1/edit
  def edit
    @tipo = Tipo.find(params[:id])
  end

  # POST /tipos
  # POST /tipos.xml
  def create
    @tipo = Tipo.new(params[:tipo])

    respond_to do |format|
      if @tipo.save
        flash[:notice] = 'Tipo was successfully created.'
        format.html { redirect_to(@tipo) }
        format.xml  { render :xml => @tipo, :status => :created, :location => @tipo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos/1
  # PUT /tipos/1.xml
  def update
    @tipo = Tipo.find(params[:id])

    respond_to do |format|
      if @tipo.update_attributes(params[:tipo])
        flash[:notice] = 'Tipo was successfully updated.'
        format.html { redirect_to(@tipo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos/1
  # DELETE /tipos/1.xml
  def destroy
    @tipo = Tipo.find(params[:id])
    @tipo.destroy

    respond_to do |format|
      format.html { redirect_to(tipos_url) }
      format.xml  { head :ok }
    end
  end
end
