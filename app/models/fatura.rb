class Fatura < ActiveRecord::Base
  
  belongs_to :cartao
  has_many :despesas
  
  def saldo
    total = 0
    despesas.each { |despesa| total += despesa.valor }
    return total
  end
  
  def saldo_formatado
    Dinheiro.new(saldo).real_formatado
  end
  
  def mes
    read_attribute(:mes).strftime("%m/%Y")
  end
end
