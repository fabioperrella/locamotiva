require 'spec_helper'

describe SubscriptionsController do

  before :each do
    @race = FactoryGirl.create :race
  end

  context "when user is logged in" do
    before :each do
      @user = FactoryGirl.create :user
      sign_in :user, @user
    end

    describe "POST create" do
      it "sets shirt_size as the shirt size of logged user" do
        post :create, { :race_id => @race }

        Subscription.first.shirt_size.should == @user.shirt_size
      end

      it "creates a subscription with a race" do
        post :create, { :race_id => @race }

        subscription = Subscription.first
        subscription.race.should == @race
        subscription.user.should == @user
      end

      it "assigns subscription" do
        post :create, { :race_id => @race }
        assigns[:subscription].should == Subscription.first
      end

      it "renders confirmation page" do
        post :create, { :race_id => @race }
        response.should render_template("subscriptions/confirm")
      end
    end

    describe "GET confirm" do
      it "flashes confimation notice" do
        pending
        post :create, { :race_id => @race, :shirt_size => @user.shirt_size }
        flash[:notice].should_not be_nil
      end
    end
    
    describe "DELETE destroy" do      
      it "deletes a subscription" do
        subscription = FactoryGirl.create :subscription, :user => @user, :race => @race 
        delete :destroy, { :race_id => @race.id }
        Subscription.find_by_race_id_and_user_id(@race,@user).should be_nil
      end
    end
  end
end