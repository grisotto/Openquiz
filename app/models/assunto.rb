class Assunto < ActiveRecord::Base
belongs_to :user
has_many :temas

end
