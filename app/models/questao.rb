class Questao < ActiveRecord::Base
belongs_to :user
belongs_to :tema
has_many :questaousers
has_many :users, through: :questaousers

validates :pergunta, length: {minimum: 5}
validates :resposta, length: {minimum: 5}
validates :dica, length: {minimum: 5}
validates :assunto_id, presence: true
validates :tema_id, presence: true


end
