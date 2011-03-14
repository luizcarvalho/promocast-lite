class Promocao < ActiveRecord::Base
  belongs_to :programa
  has_many :ouvinte_promocoes
  has_many :ouvintes,:through=>:ouvinte_promocoes
  
  validates_presence_of :titulo,:inicio,:fim,:multiusuario,:programa_id
  validates_length_of :titulo,:maximum => 100



  def ativo_tos
    ativo? ? "Ativa" : "Finalizada"

  end
  
  def inicio_tos
    inicio.strftime("%d/%m/%Y")
  end

  def fim_tos
    fim.strftime("%d/%m/%Y")
  end

end
