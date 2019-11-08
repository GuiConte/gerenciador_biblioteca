class CreateReaders < ActiveRecord::Migration[6.0]
  def change
    create_table :readers do |t|
      t.string :nome, null: false
      t.string :cpf, null: false
      t.string :endereco, null: false
      t.string :cidade, null: false
      t.string :uf, null: false
      t.string :email, null: false
      t.string :telefone, null: false

      t.timestamps
    end
  end
end
