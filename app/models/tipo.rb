class Tipo < ActiveRecord::Base
  validates_presence_of :nome
  
  belongs_to :user
  has_many :movimentos
end
