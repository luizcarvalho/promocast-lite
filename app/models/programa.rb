class Programa < ActiveRecord::Base
  has_many :promocoes

  validates_presence_of :nome

end
