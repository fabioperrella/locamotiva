require "spec_helper"

describe 'votes/index' do
  before :each do
    @user = FactoryGirl.create :user
    sign_in :user, @user
    assign(:races,[create(:race)])
    assign(:date_filter,Date.today.beginning_of_month + 1.month)
  end

  context "when can vote" do
    it 'shows vote links' do
      view.stub(:can_vote?).and_return true
      render
      rendered.should =~ /votar/
    end
  end

  context "when can cancel vote" do
    it 'shows vote links' do
      view.stub!(:can_vote?).and_return(false)
      view.stub!(:can_cancel_vote?).and_return(true)
      render
      rendered.should =~ /cancelar voto/
    end
  end
end