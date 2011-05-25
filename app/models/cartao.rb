class Cartao < ActiveRecord::Base
  validates_presence_of :user_id, :descricao, :vencimento
  
  belongs_to :user
  has_many :faturas
  
  def fatura_atual(cartao_id)
    Fatura.find_by_cartao_id_and_situacao(cartao_id, "Aberta")
  end
end
