class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.creator_id = current_user.id
    if @track.save
      redirect_to track_path(@track)
    else
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    @subscription = current_user.subscriptions.where(track_id: @track.id).first || Subscription.new
  end

  private
  def track_params
    params.require(:track).permit(:title, :description)
  end
end
