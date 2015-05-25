class User < ActiveRecord::Base
has_many :assuntos
has_many :temas
has_many :questaos
has_many :questaousers
has_many :questaos, through: :questaousers
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
