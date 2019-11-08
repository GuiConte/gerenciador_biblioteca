class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.belongs_to :reader, null:false
      t.belongs_to :book, null:false
      t.date :data_emprestimo, null:false
      t.date :data_devolucao, null:false
      t.boolean :devolvido, null:false, default: false

      t.timestamps
    end
  end
end
