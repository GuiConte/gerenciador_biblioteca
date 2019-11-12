class Book < ApplicationRecord

  validates :titulo, presence: true, length: { maximum: 30}
  validates :autor, presence: true, length: { maximum: 30}
  validates :descricao, presence: true
  validates :edicao, presence: true, length: { maximum: 30}
  validates :editora, presence: true, length: { maximum: 30}
  validates :quantidade, presence: true, numericality: { only_integer: true }

end
