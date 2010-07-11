class Pagamento < ActiveRecord::Base
  
  belongs_to :user
  
  def confirmado_pt
    if confirmado
      return "Sim"
    else
      return "Não"
    end
  end
end
