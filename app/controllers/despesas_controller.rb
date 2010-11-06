class DespesasController < ApplicationController
  before_filter :authenticate_user!
  
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

  def edit
    @despesa = Despesa.find(params[:id])
  end

  def create
    @despesa = Despesa.new(params[:despesa])
    fatura_original = @despesa.fatura
    
    # Valida a despesa antes de qualquer operação
    unless @despesa.valid?
      respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @despesa.errors, :status => :unprocessable_entity }
      end
      return
    end
    
    if @despesa.parcelas == 1
      @despesa.save
      flash[:notice] = 'Despesa cadastrada com sucesso.'
      
    else
      Despesa.transaction do
        # Parcelamento
        valor_parcelas = @despesa.valor / @despesa.parcelas
        mes_fatura_atual = @despesa.fatura.mes
      
        Range.new(1, @despesa.parcelas).each do |parcela|
          despesa = Despesa.new
          despesa.data = @despesa.data
          despesa.tipo = @despesa.tipo
          despesa.parcelas = @despesa.parcelas
          despesa.descricao = "#{@despesa.descricao} - P.#{parcela}/#{@despesa.parcelas}"
          despesa.valor = valor_parcelas
        
          despesa.fatura = @despesa.fatura
          despesa.save!
        
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
              fatura.save!

              @despesa.fatura = fatura
            end
          end
        end
      
        flash[:notice] = 'Despesa parcelada cadastrada com sucesso.'
      end
    end
    
    respond_to do |format|
      format.html { redirect_to(fatura_original) }
      format.xml  { render :xml => @despesa, :status => :created, :location => @despesa }
    end
  end

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

  def destroy
    @despesa = Despesa.find(params[:id])
    @despesa.destroy

    respond_to do |format|
      flash[:notice] = 'Despesa removida com sucesso.'
      format.html { redirect_to(@despesa.fatura) }
      format.xml  { head :ok }
    end
  end
end
