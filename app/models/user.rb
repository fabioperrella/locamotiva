class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :cpf, :role, :shirt_size, :department, :born_at

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :cpf
  validates_presence_of :role
  validates_numericality_of :cpf
  validates_size_of :cpf, :is => 11
end
