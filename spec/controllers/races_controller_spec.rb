require 'spec_helper'

describe RacesController do

  def valid_attributes
    {:name => "aaaa"}
  end

  describe "GET index" do
    it "assigns future races as @races, ordered by date" do
      race1 = FactoryGirl.create :race, :date => Date.today - 1.hour
      race2 = FactoryGirl.create :race, :date => Date.today
      race3 = FactoryGirl.create :race, :date => Date.today + 1.day
      race = Race.create! valid_attributes
      get :index
      assigns(:races).should eq([race2, race3])
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