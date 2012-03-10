require 'spec_helper'

describe VotesHelper do
  before :each do
    @user = FactoryGirl.create :user
    sign_in :user, @user
    @race = create :race, date: Date.today + 1.month
    # @view.stub(:resource).and_return(Vote.new)
    # @view.stub(:resource_name).and_return('vote')
  end

  describe "can_vote?" do
    context "when date_filter is next month" do
      before :each do
        assign(:date_filter,Date.today.beginning_of_month + 1.month)
      end

      context "when not voted in race" do
        it 'returns true' do
          helper.can_vote?(@race).should be_true
        end
      end

      context "when already voted in race" do
        before :each do
          create :vote, race: @race, user_id: @user.id
        end

        it 'returns false' do
          helper.can_vote?(@race).should be_false
        end
      end
    end

    context "when date_filter is current month" do
      before :each do
        assign(:date_filter,Date.today.beginning_of_month)
      end

      it 'returns false' do
        helper.can_vote?(@race).should be_false
      end
    end
  end

  describe "can_cancel_vote?" do
    context "when date_filter is next month" do
      before :each do
        assign(:date_filter,Date.today.beginning_of_month + 1.month)
      end

      context "when not voted in race" do
        it 'returns false' do
          helper.can_cancel_vote?(@race).should be_false
        end
      end

      context "when already voted in race" do
        before :each do
          create :vote, race: @race, user_id: @user.id
        end

        it 'returns true' do
          helper.can_cancel_vote?(@race).should be_true
        end
      end
    end

    context "when date_filter is current month" do
      before :each do
        assign(:date_filter,Date.today.beginning_of_month)
      end

      it 'returns false' do
        helper.can_cancel_vote?(@race).should be_false
      end
    end
  end
end