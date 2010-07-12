class Agenda < ActiveRecord::Base
  
  belongs_to :user
  has_many :pagamentos, :order => "vencimento"
  
  def valor_confirmado
    valor = 0
    pagamentos.each do |pagamento|
      valor += pagamento.valor if pagamento.confirmado
    end
    return valor
  end
  
  def valor_pendente
    valor = 0
    pagamentos.each do |pagamento|
      valor += pagamento.valor unless pagamento.confirmado
    end
    return valor
  end
  
  def confirmado
    confirmado = true
    pagamentos.each do |pagamento|
      return "Não" unless pagamento.confirmado
    end
    return "Sim"
  end
end
