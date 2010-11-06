class Fatura < ActiveRecord::Base
  
  belongs_to :cartao
  has_many :despesas, :order => "data"
  
  def saldo
    total = 0
    despesas.each { |despesa| total += despesa.valor }
    return total
  end
  
  def saldo_formatado
    Dinheiro.new(saldo).real_formatado
  end
  
  def mes_formatado
    read_attribute(:mes).strftime("%m/%Y")
  end
  
  def proxima_fatura
    mes_proxima_fatura = mes >> 1
    proxima_fatura = Fatura.find_by_cartao_id_and_mes(cartao.id, mes_proxima_fatura)
    
    if proxima_fatura == nil
      proxima_fatura = Fatura.new
      proxima_fatura.cartao = cartao
      proxima_fatura.mes = Date.new(mes_proxima_fatura.year, mes_proxima_fatura.month)
      proxima_fatura.situacao = "Prevista"
      proxima_fatura.save
    end
    
    return proxima_fatura
  end
end
