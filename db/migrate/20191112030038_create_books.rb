class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :titulo, null:false
      t.string :autor, null:false
      t.string :descricao, null:false
      t.string :edicao, null:false
      t.string :editora, null:false
      t.integer :quantidade, null:false, default: 0

      t.timestamps
    end
  end
end
