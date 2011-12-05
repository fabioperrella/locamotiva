class RacesController < ApplicationController
  # GET /races
  # GET /races.json
  def index
    @races = Race.where("date >= :today", :today => Date.today).order(:date)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @races }
    end
  end

  def index_old
    @races = Race.where("date < :today", :today => Date.today).order(:date)

    respond_to do |format|
      format.html
      format.json { render json: @races }
    end
  end
  
  # GET /races/1
  # GET /races/1.json
  def show
    @race = Race.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @race }
    end
  end
end