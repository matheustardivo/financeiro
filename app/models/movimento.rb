class Movimento < ActiveRecord::Base
  validates_presence_of :conta_id, :tipo_id, :valor
  
  belongs_to :conta
  belongs_to :tipo
  
  def dia_to_s
    read_attribute(:dia).to_s_br
  end
  
  def valor_formatado
    Dinheiro.new(read_attribute(:valor)).real_formatado
  end
end
