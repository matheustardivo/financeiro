class Conta < ActiveRecord::Base
  validates_presence_of :nome
  
  has_many :movimentos
  
  def saldo
    saldo_atual = 0
    
    movimentos.each do |movimento|
      if movimento.tipo.valor == 'C'
        saldo_atual += movimento.valor
      else
        saldo_atual -= movimento.valor
      end
    end
    
    return saldo_atual
  end
  
end
