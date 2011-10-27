require 'spec_helper'

describe Subscription do
  it { should belong_to(:user) }
  it { should belong_to(:race) }
  it { should validate_presence_of :shirt_size}

  describe "#new" do
    it "sets shirt size the user default shirt size" do 
      user = FactoryGirl.build :user
      s = Subscription.new :user=> user
      s.shirt_size.should == user.shirt_size
    end
  end
end
