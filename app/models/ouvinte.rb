class Ouvinte < ActiveRecord::Base
  has_many :promocoes,:through=>:ouvinte_promocoes
  has_many :ouvinte_promocoes




def ativo_tos
  ativo ? "Ativo" : "Inativo"
end

def nascimento_tos
  nascimento.strftime("%d/%m/%Y")
end

end
