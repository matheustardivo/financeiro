class MovimentosController < ApplicationController
  def create
    @movimento = Movimento.new(params[:movimento])

    respond_to do |format|
      if @movimento.save
        flash[:notice] = 'Movimento was successfully created.'
        format.html { redirect_to(@movimento) }
        format.xml  { render :xml => @movimento, :status => :created, :location => @movimento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movimento.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def index
    @movimentos = Movimento.all
  end
  
  def edit
    @movimento = Movimento.find(params[:id])
  end
  
  def update
    @movimento = Movimento.find(params[:id])

    respond_to do |format|
      if @movimento.update_attributes(params[:movimento])
        flash[:notice] = 'Movimento was successfully updated.'
        format.html { redirect_to(@movimento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movimento.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @movimento = Movimento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movimento }
    end
  end
  
  def new
    @movimento = Movimento.new
    if params[:conta_id] != nil
      @movimento.conta_id = params[:conta_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movimento }
    end
  end
end
