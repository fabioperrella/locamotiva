module VotesHelper
  def can_vote?(race)
    current_user &&
    @date_filter.beginning_of_month == (Date.today.beginning_of_month + 1.month) &&
    !current_user.votes.map(&:race_id).include?(race.id)
  end
end