class Agenda < ActiveRecord::Base
  
  validates_presence_of :nome, :mes
  validates_uniqueness_of :nome, :mes
  
  belongs_to :user
  has_many :pagamentos, :order => "vencimento"
  
  def valor_confirmado
    valor = 0
    pagamentos.each do |pagamento|
      valor += pagamento.valor if pagamento.confirmado
    end
    
    faturas.each do |fatura|
      valor += fatura.saldo if fatura.confirmado
    end
    return Dinheiro.new(valor).real_formatado
  end
  
  def valor_pendente
    valor = 0
    pagamentos.each do |pagamento|
      valor += pagamento.valor unless pagamento.confirmado
    end
    
    faturas.each do |fatura|
      valor += fatura.saldo unless fatura.confirmado
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
  
  def mes_formatado
    read_attribute(:mes).strftime("%m/%Y")
  end
  
  def mes_formatado=(mes_atual)
    write_attribute(:mes, Date.strptime(mes_atual, "%m/%Y"))
  end
  
  def faturas
    nil unless :mes
    
    Fatura.where("faturas.mes = ? and cartaos.user_id = ?", self.mes, self.user_id).
      joins("inner join cartaos on faturas.cartao_id = cartaos.id").
      order("cartaos.descricao")
  end
end
