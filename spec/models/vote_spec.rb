require 'spec_helper'

describe Vote do
  it { should belong_to(:user) }
  it { should belong_to(:race) }
  it { should validate_presence_of :user}
  it { should validate_presence_of :race}
end