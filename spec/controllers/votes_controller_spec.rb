require 'spec_helper'

describe VotesController do
  describe "GET index" do
    it "assigns races with races that will happen next month ordered by date" do
      race0 = FactoryGirl.create :race, :date => Date.today
      race1 = FactoryGirl.create :race, :date => Date.today + 1.month
      race2 = FactoryGirl.create :race, :date => Date.today + 1.month + 2.day
      get :index
      assigns(:races).should == [race1,race2]
    end

    it "renders index template" do
      get :index
      response.should render_template("index")
    end
  end
end