class SubscriptionsController < ApplicationController
  def create
    @race = Race.find(params[:race_id])
    subscription = Subscription.new(:user => current_user, :race => @race, :shirt_size => params[:shirt_size])

    if subscription.save
      flash[:notice] = I18n.t(:subscription_saved_successfull, :race_name => @race.name)
    else
      flash[:alert] = subscription.errors.full_messages
    end

    redirect_to races_path
  end

  def destroy
    subscription = current_user.subscriptions.find_by_race_id params[:race_id]
    subscription.destroy
    redirect_to races_path, :notice => I18n.t(:subscription_destroyed_successfull, :race_name => subscription.race.name)
  end
end