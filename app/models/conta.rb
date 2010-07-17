class Conta < ActiveRecord::Base
  validates_presence_of :nome, :user_id
  
  belongs_to :user
  has_many :movimentos, :order => "dia DESC"
  
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
  
  def saldo_formatado
    Dinheiro.new(saldo).real_formatado
  end
  
end
