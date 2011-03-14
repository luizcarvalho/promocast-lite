class OuvintePromocao < ActiveRecord::Base
  belongs_to :ouvinte
  belongs_to :promocao
end
