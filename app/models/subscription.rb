class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :race
  validates_presence_of :shirt_size
end