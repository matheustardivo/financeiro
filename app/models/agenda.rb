class Agenda < ActiveRecord::Base
  
  validates_presence_of :nome, :mes
  
  belongs_to :user
  has_many :pagamentos, :order => "vencimento"
  
  def valor_confirmado
    valor = 0
    pagamentos.each do |pagamento|
      valor += pagamento.valor if pagamento.confirmado
    end
    return Dinheiro.new(valor).real_formatado
  end
  
  def valor_pendente
    valor = 0
    pagamentos.each do |pagamento|
      valor += pagamento.valor unless pagamento.confirmado
    end
    return Dinheiro.new(valor).real_formatado
  end
  
  def confirmado
    confirmado = true
    pagamentos.each do |pagamento|
      return "Não" unless pagamento.confirmado
    end
    return "Sim"
  end
  
  def mes
    read_attribute(:mes).strftime("%m/%Y")
  end
end
