class Depoimento < ApplicationRecord
  belongs_to :usuario
  validates :texto, length: {maximum: 1000}
  def usuario(id)
    @depoimento.id
  end  
end
