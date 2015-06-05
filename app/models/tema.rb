class Tema < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nome_tema, use: :slugged
belongs_to :user
belongs_to :assunto
has_many :questaos, :dependent => :destroy
validates :nome_tema, length: {minimum: 5}
validates :assunto_id, presence: true
end
