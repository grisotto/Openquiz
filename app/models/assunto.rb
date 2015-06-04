class Assunto < ActiveRecord::Base
belongs_to :user
has_many :temas, :dependent => :destroy
mount_uploader :link_image, ImageUploader
validates :nome_assunto, length: {minimum: 5}
validates :descricao, length: {minimum: 10}

end
