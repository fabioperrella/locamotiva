require 'spec_helper'

describe Race do
  it { should validate_presence_of(:name) }

  it { should have_many(:users).through(:subscriptions) }
  it { should have_many(:subscriptions) }
end
