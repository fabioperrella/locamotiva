module VotesHelper
  def can_vote?
    current_user && @date_filter.beginning_of_month == (Date.today.beginning_of_month + 1.month)
  end
end