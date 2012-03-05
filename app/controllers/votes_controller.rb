class VotesController < ApplicationController
  def index
    if params["year"] && params["month"]
      @date_filter = Date.new(params["year"].to_i,params["month"].to_i,1)
    else
      @date_filter = Date.today + 1.month
    end
    @races = Race.where(date: @date_filter.beginning_of_month..@date_filter.end_of_month).order(:date)
  end
end