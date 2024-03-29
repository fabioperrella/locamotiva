require 'spec_helper'

describe RacesController do

  describe "GET index" do
    it "assigns confirmed future races as @races, ordered by date" do
      race1 = FactoryGirl.create :race, :date => Date.today, state: :not_confirmed
      race1 = FactoryGirl.create :race, :date => Date.today - 1.hour
      race2 = FactoryGirl.create :race, :date => Date.today
      race3 = FactoryGirl.create :race, :date => Date.today + 1.day
      get :index
      assigns(:races).should eq([race2, race3])
    end
  end

  describe "GET index_old" do
    it "assigns confirmed past races as @races, ordered by date" do
      racea = FactoryGirl.create :race, :date => Date.today - 1.day, state: :not_confirmed
      race0 = FactoryGirl.create :race, :date => Date.today - 1.day
      race1 = FactoryGirl.create :race, :date => Date.today - 2.day
      race2 = FactoryGirl.create :race, :date => Date.today
      race3 = FactoryGirl.create :race, :date => Date.today + 1.day
      get :index_old
      assigns(:races).should eq([race1, race0])
    end

    it "renders template index_old" do
      get :index_old
      response.should render_template('index_old')
    end
  end

  describe "GET show" do
    it "assigns the requested race as @race" do
      race = FactoryGirl.create :race
      get :show, :id => race.id.to_s
      assigns(:race).should eq(race)
    end
  end
end