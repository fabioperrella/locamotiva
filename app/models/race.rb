class Race < ActiveRecord::Base
  validates_presence_of :name, :url, :vacancies, :date, :distance, :place
  validates_format_of :url, with: /^http:\/\//

  has_many :subscriptions
  has_many :users, :through => :subscriptions

  scope :confirmed, where(state: :confirmed)
  scope :coming_next, where("date >= :date_today", :date_today => Date.today)
  scope :accomplished, confirmed.where("date < :date_today", :date_today => Date.today)
  scope :next_month, where("date BETWEEN ? and ?", Date.today.beginning_of_month + 1.month, Date.today.beginning_of_month + 2.month)

  state_machine :state, initial: :not_confirmed do
    event :confirm do
      transition :not_confirmed => :confirmed
    end
  end
end