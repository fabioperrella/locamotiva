class SubscriptionsController < ApplicationController
  def new
    race = Race.find(params[:race_id])
    @subscription = race.subscriptions.new(:user => current_user, :shirt_size => current_user.shirt_size)
  end

  def create
    race = Race.find(params[:race_id])
    @subscription = race.subscriptions.new(params[:subscription])
    @subscription.user = current_user
    if @subscription.save
      flash[:notice] = I18n.t(:subscription_saved_successfull, :race_name => race.name)
      redirect_to race_subscriptions_path(race)
    else
      flash[:alert] = @subscription.errors.full_messages
      render :action => :new
    end
  end

  def destroy
    subscription = current_user.subscriptions.find_by_race_id params[:race_id]
    subscription.destroy
    redirect_to races_path, :notice => I18n.t(:subscription_destroyed_successfull, :race_name => subscription.race.name)
  end

  def show
    @subscriptions = Subscription.where(:race_id => params[:race_id]).order(:created_at)
  end
end