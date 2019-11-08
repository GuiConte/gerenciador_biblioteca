class Loan < ApplicationRecord
  belongs_to :reader
  belongs_to :book

  validates :reader_id, presence: true
  validates :book_id, presence: true
  validates :data_emprestimo, presence: true
  validates :data_devolucao, presence: true

end
