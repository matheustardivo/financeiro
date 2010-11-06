class Pagamento < ActiveRecord::Base
  
  validates_presence_of :nome, :vencimento, :valor
  
  belongs_to :user
  belongs_to :agenda
  
  def confirmado_pt
    if confirmado
      return "Sim"
    else
      return "Não"
    end
  end
  
  def vencimento_to_s
    read_attribute(:vencimento).to_s_br
  end
  
  def valor_formatado
    Dinheiro.new(read_attribute(:valor)).real_formatado
  end
end
