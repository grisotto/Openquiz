class Assunto < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nome_assunto, use: :slugged
belongs_to :user
has_many :temas, :dependent => :destroy
mount_uploader :link_image, ImageUploader
validates :nome_assunto, length: {minimum: 5}
validates :descricao, length: {minimum: 10}

end
