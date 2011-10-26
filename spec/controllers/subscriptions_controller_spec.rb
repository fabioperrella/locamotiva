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
    
    describe "DELETE destroy" do      
      it "deletes a subscription" do
        subscription = FactoryGirl.create :subscription, :user => @user, :race => @race 
        delete :destroy, { :race_id => @race.id }
        Subscription.find_by_race_id_and_user_id(@race,@user).should be_nil
      end
    end
  end
end