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
end
