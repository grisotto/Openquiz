class Questaouser < ActiveRecord::Base
belongs_to :user
belongs_to :questao
end
