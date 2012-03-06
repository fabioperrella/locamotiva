class VotesController < ApplicationController
  def index
    if params["year"] && params["month"]
      @date_filter = Date.new(params["year"].to_i,params["month"].to_i,1)
    else
      @date_filter = Date.today + 1.month
    end
    @races = Race.where(date: @date_filter.beginning_of_month..@date_filter.end_of_month).order(:date)
  end

  def create
    vote = Vote.new race_id: params["race_id"], user: current_user
    if vote.save
      flash[:notice] = I18n.t(:vote_created_sucessfull)
    end
    redirect_to votes_path
  end
end