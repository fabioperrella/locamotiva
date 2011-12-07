class VotingController < ApplicationController
  def index
    @races = Race.next_month.order(:date)
  end
end