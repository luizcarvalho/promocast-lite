class CreateProgramas < ActiveRecord::Migration
  def self.up
    create_table :programas do |t|
      t.string :nome, :null=>false
      t.text :descricao
      t.text :locutores
      t.boolean :status

      t.timestamps
    end
  end

  def self.down
    drop_table :programas
  end
end
