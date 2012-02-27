require 'spec_helper'

describe Race do
  it { should validate_presence_of(:name) }

  it { should have_many(:users).through(:subscriptions) }
  it { should have_many(:subscriptions) }

  describe "state machine" do
    it "has some status" do
      Race.state_machines[:state].states.map(&:name).should == [:not_confirmed, :confirmed]
    end

    it "has some events" do
      Race.state_machines[:state].events.keys.should == [:confirm]
    end
  end
end
