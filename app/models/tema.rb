class Tema < ActiveRecord::Base
belongs_to :user
belongs_to :assunto
has_many :questaos
end
