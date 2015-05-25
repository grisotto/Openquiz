class Questao < ActiveRecord::Base
belongs_to :user
belongs_to :tema
has_many :questaousers
has_many :users, through: :questaousers

end
