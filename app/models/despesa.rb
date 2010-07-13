class Despesa < ActiveRecord::Base
  
  validates_presence_of :data, :tipo_id, :parcelas, :valor
  
  belongs_to :fatura
  belongs_to :tipo
end
