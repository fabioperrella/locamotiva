class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :name, :cpf, :role, :shirt_size, :department, :birth_date

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :cpf
  validates_presence_of :role
  validates_presence_of :shirt_size
  validates_numericality_of :cpf
  validates_size_of :cpf, :is => 11

  before_validation(:on => :create) do
    set_default_password
  end

  after_initialize :init

  private

  def set_default_password
    self.password = AppConfig.default_password
    self.password_confirmation = AppConfig.default_password
  end
   
  def init
    self.role ||= "user"
  end
end