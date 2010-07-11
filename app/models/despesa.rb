class Despesa < ActiveRecord::Base
  
  belongs_to :fatura
  belongs_to :tipo
end
