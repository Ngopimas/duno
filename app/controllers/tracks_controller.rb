class TracksController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        tracks.title @@ :query \
        OR tracks.description @@ :query \
      "
      @track_paramss = Track.where(sql_query, query: "%#{params[:query]}%")
    else
      @tracks = Track.all
      @track = Track.new
    end
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.creator_id = current_user.id
    @track.color_theme = "#FFCD00"
    if @track.save
      redirect_to edit_track_path(@track)
    else
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    @subscription = current_user.subscriptions.where(track_id: @track.id).first || Subscription.new
    @chapter = Chapter.new
  end

  def edit
    @track = Track.find(params[:id])
    @subscription = current_user.subscriptions.where(track_id: @track.id).first || Subscription.new
    @chapter = Chapter.new
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to edit_track_path(@track, toto:"toto")
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to tracks_path
  end

  private
  def track_params
    params.require(:track).permit(:title, :description, :photo, :color_theme, :font_theme)
  end
end
