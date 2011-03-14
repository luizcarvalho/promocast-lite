class CreateOuvintePromocoes < ActiveRecord::Migration
  def self.up
    create_table :ouvinte_promocoes do |t|
      t.integer :ouvinte_id
      t.integer :promocao_id
      t.boolean :premiado

      t.timestamps
    end
  end

  def self.down
    drop_table :ouvinte_promocoes
  end
end
