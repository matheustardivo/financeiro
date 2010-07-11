class DespesasController < ApplicationController
  # GET /despesas/new
  # GET /despesas/new.xml
  def new
    if params[:fatura_id] == nil
      flash[:notice] = 'Fatura não encontrada.'
      redirect_to :back
    end
    
    @despesa = Despesa.new
    @despesa.fatura = Fatura.find(params[:fatura_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @despesa }
    end
  end

  # GET /despesas/1/edit
  def edit
    @despesa = Despesa.find(params[:id])
  end

  # POST /despesas
  # POST /despesas.xml
  def create
    @despesa = Despesa.new(params[:despesa])
    
    # Se a quantidade de parcelas for maior que 1
    if @despesa.parcelas > 1
      despesa_cadastrada = true
      
      valor_parcelas = @despesa.valor / @despesa.parcelas
      fatura_original = @despesa.fatura
      mes_fatura_atual = @despesa.fatura.mes
      
      Range.new(1, @despesa.parcelas).each do |parcela|
        despesa = Despesa.new
        despesa.data = @despesa.data
        despesa.tipo = @despesa.tipo
        despesa.parcelas = @despesa.parcelas
        despesa.descricao = "#{@despesa.descricao} - P.#{parcela}/#{@despesa.parcelas}"
        despesa.valor = valor_parcelas
        
        despesa.fatura = @despesa.fatura
        unless despesa.save
          despesa_cadastrada = false
          format.html { render :action => "new" }
          format.xml  { render :xml => @despesa.errors, :status => :unprocessable_entity }
        end
        
        if parcela < @despesa.parcelas
          @despesa.data = @despesa.data >> 1
          mes_fatura_atual = mes_fatura_atual >> 1

          @despesa.fatura = Fatura.find_by_cartao_id_and_mes(
            @despesa.fatura.cartao.id, mes_fatura_atual)

          if @despesa.fatura == nil
            fatura = Fatura.new
            fatura.cartao = fatura_original.cartao
            fatura.mes = Date.new(mes_fatura_atual.year, mes_fatura_atual.month)
            fatura.situacao = "Prevista"
            fatura.save

            @despesa.fatura = fatura
          end
        end
      end
      
      if despesa_cadastrada
        respond_to do |format|
          flash[:notice] = 'Despesa parcelada cadastrada com sucesso.'
          format.html { redirect_to(fatura_original) }
          format.xml  { render :xml => @despesa, :status => :created, :location => @despesa }
        end
      end
      
      return
    end
    
    respond_to do |format|
      if @despesa.save
        flash[:notice] = 'Despesa cadastrada com sucesso.'
        format.html { redirect_to(@despesa.fatura) }
        format.xml  { render :xml => @despesa, :status => :created, :location => @despesa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @despesa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /despesas/1
  # PUT /despesas/1.xml
  def update
    @despesa = Despesa.find(params[:id])

    respond_to do |format|
      if @despesa.update_attributes(params[:despesa])
        flash[:notice] = 'Despesa atualizada com sucesso.'
        format.html { redirect_to(@despesa.fatura) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @despesa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /despesas/1
  # DELETE /despesas/1.xml
  def destroy
    @despesa = Despesa.find(params[:id])
    @despesa.destroy

    respond_to do |format|
      format.html { redirect_to(@despesa.fatura) }
      format.xml  { head :ok }
    end
  end
end
