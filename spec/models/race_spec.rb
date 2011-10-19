require 'spec_helper'

describe Race do
  it { should validate_presence_of(:name) }
end
