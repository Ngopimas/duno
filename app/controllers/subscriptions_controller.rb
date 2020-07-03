class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new
    @track = Track.find(params[:track_id])
    @subscription.user = current_user
    @subscription.track = @track
    @subscription.save
    redirect_to track_path(@track)
  end
end
