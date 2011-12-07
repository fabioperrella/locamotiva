class Race < ActiveRecord::Base
  validates_presence_of :name

  has_many :subscriptions
  has_many :users, :through => :subscriptions

  scope :confirmed, where(:confirmed => true)
  scope :coming_next, where("date >= :date_today", :date_today => Date.today)
  scope :accomplished, where("date < :date_today AND confirmed = true", :date_today => Date.today)
end
