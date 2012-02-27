class Race < ActiveRecord::Base
  validates_presence_of :name

  has_many :subscriptions
  has_many :users, :through => :subscriptions

  scope :confirmed, where(:confirmed => true)
  scope :coming_next, where("date >= :date_today", :date_today => Date.today)
  scope :accomplished, where("date < :date_today AND confirmed = true", :date_today => Date.today)
  scope :next_month, where("date BETWEEN ? and ?", Date.today.beginning_of_month + 1.month, Date.today.beginning_of_month + 2.month)

  state_machine :state, initial: :not_confirmed do
    event :confirm do
      transition :not_confirmed => :confirmed
    end
  end
end