class Reader < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :nome, presence: true, length: { maximum: 50}
  validates :cpf, presence: true, length: { maximum: 14}
  validates :endereco, presence: true, length: { maximum: 50}
  validates :cidade, presence: true, length: { maximum: 40}
  validates :uf, presence: true, length: { maximum: 2}
  validates :email, presence: true, length: { maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: true }
  validates :telefone, presence: true, length: { maximum: 20}

end
