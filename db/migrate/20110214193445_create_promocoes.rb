class CreatePromocoes < ActiveRecord::Migration
  def self.up
    create_table :promocoes do |t|
      t.integer :programa_id
      t.string :titulo,:null=>false
      t.datetime :inicio
      t.datetime :fim
      t.boolean :multiusuario,:default=>true
      t.text :premiacao
      t.text :descricao
      t.boolean :ativo,:default=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :promocoes
  end
end
