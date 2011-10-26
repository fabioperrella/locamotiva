class SubscriptionsController < ApplicationController
  def create
    @race = Race.find(params[:race_id])
    subscription = Subscription.new(:user => current_user, :race => @race)

    if subscription.save
      flash[:notice] = I18n.t(:subscription_saved_successfull, :race_name => @race.name)
    else
      flash[:alert] = subscription.errors.full_messages
    end

    redirect_to races_path
  end
end