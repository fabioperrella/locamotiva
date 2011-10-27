class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :race

  validates_presence_of :shirt_size
  after_initialize :init

  # def user=(_user)
  #   self[:shirt_size] = _user.shirt_size
  #   self[:user] = _user
  # end

  private 

  def init
    self[:shirt_size] = self.user.shirt_size
  end
end