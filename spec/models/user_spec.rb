require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:shirt_size) }
  it { should validate_numericality_of(:cpf) }
  it { should ensure_length_of(:cpf).is_equal_to(11) }

  it { should have_many(:races).through(:subscriptions) }
  it { should have_many(:subscriptions) }

  describe ".create" do
    it "should set default role as user" do
      u = User.new
      u.save
      u.role.should == "user"
    end
  end
end