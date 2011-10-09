require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:shirt_size) }
  it { should validate_numericality_of(:cpf) }
  it { should ensure_length_of(:cpf).is_equal_to(11) }

  describe ".create" do
    it "should set the default password" do
      user = FactoryGirl.create :user
      user.password.should == "inicial1234"
    end
  end
end
