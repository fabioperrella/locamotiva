require 'spec_helper'

describe Subscription do
  it { should belong_to(:user) }
  it { should belong_to(:race) }
  it { should validate_presence_of :shirt_size}
end