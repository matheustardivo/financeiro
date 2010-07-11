class Fatura < ActiveRecord::Base
  
  belongs_to :cartao
  has_many :despesas
  
  def saldo
    total = 0
    despesas.each { |despesa| total += despesa.valor }
    return total
  end
end
