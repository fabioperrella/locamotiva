class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :race
  validates_presence_of :user
  validates_presence_of :race
end