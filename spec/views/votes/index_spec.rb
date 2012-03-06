require "spec_helper"

describe 'votes/index' do
  before :each do
    @user = FactoryGirl.create :user
    sign_in :user, @user
    # @view.stub(:resource).and_return(Vote.new)
    # @view.stub(:resource_name).and_return('vote')
    assign(:races,[create(:race)])
    assign(:date_filter,Date.today.beginning_of_month + 1.month)
  end

  context "when date is next month" do
    it 'shows vote links' do
      render
      rendered.should =~ /votar/
    end
  end

  context "when date is current month" do
    before :each do
      assign(:date_filter,Date.today.beginning_of_month)
    end

    it 'does not show vote links' do
      render
      rendered.should_not =~ /votar/
    end
  end

  context "when already voted in race" do
    before :each do
      race = create(:race)
      vote = create :vote, race_id: race.id, user_id: @user.id
      assign(:races,[race])
    end

    it 'does not show vote links' do
      render
      rendered.should_not =~ /votar/
    end
  end
end