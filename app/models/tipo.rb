class Tipo < ActiveRecord::Base
  validates_presence_of :nome
  
  has_many :movimentos
end
