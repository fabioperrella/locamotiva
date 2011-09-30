require 'spec_helper'

describe RacesController do

  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all races as @races" do
      race = Race.create! valid_attributes
      get :index
      assigns(:races).should eq([race])
    end
  end

  describe "GET show" do
    it "assigns the requested race as @race" do
      race = Race.create! valid_attributes
      get :show, :id => race.id.to_s
      assigns(:race).should eq(race)
    end
  end
end