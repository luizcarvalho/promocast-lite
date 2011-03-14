class CreateOuvintes < ActiveRecord::Migration
  def self.up
    create_table :ouvintes do |t|
      t.string :nome,:null=>false
      t.string :telefone,:null=>false
      t.string :endereco
      t.date :nascimento
      t.string :cpf
      t.string :rg
      t.boolean :ativo,:null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :ouvintes
  end
end
