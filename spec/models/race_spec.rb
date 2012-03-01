require 'spec_helper'

describe Race do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:vacancies) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:place) }
  it { should validate_format_of(:url).with('http://g1.com.br') }
  it { should_not validate_format_of(:url).with('g1.com.br') }

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
