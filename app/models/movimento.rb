class Movimento < ActiveRecord::Base
  validates_presence_of :conta_id, :tipo_id, :valor
  
  belongs_to :conta
  belongs_to :tipo
end
