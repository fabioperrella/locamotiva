class Race < ActiveRecord::Base
  validates_presence_of :name

  has_many :subscriptions
  has_many :users, :through => :subscriptions
end
