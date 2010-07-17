class Despesa < ActiveRecord::Base
  
  validates_presence_of :data, :tipo_id, :parcelas, :valor
  
  belongs_to :fatura
  belongs_to :tipo
  
  def data_br
    read_attribute(:data).to_s_br
  end
  
  def valor_formatado
    Dinheiro.new(read_attribute(:valor)).real_formatado
  end
end
