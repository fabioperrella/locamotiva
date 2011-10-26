class User < ActiveRecord::Base

  has_many :subscriptions
  has_many :races, :through => :subscriptions

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :cpf, :role, :shirt_size, :department, :birth_date

  # os usuarios com mais privilegios devem ficar a direita
  ROLES = %w(user admin)

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :cpf
  validates_presence_of :role
  validates_presence_of :shirt_size
  validates_numericality_of :cpf
  validates_size_of :cpf, :is => 11

  after_initialize :init

  def role?(base_role)
    return false if role.blank? # A user have a role attribute. If not set, the user does not have any roles.
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  private

  def init
    self.role ||= "user"
  end
end