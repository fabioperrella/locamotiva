require 'spec_helper'

describe SubscriptionsController do

  describe "POST create" do
    context "when user is logged in" do       
      before :each do
        @user = FactoryGirl.create :user
        sign_in :user, @user
        @race = FactoryGirl.create :race
      end

      it "creates a subscription with a race" do
        post :create, { :race_id => @race }
        
        subscription = Subscription.first
        subscription.race.should == @race
        subscription.user.should == @user
      end

      it "flashes confimation notice" do
        post :create, { :race_id => @race }
        flash[:notice].should_not be_nil
      end
    end
  end
end