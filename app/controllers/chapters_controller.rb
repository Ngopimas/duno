class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end

  def new
    @track = Track.find(params[:track_id])
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @track = Track.find(params[:track_id])
    @chapter.track = @track
    if @chapter.save
      redirect_to track_path(@track)
    else
      render :new
    end
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :content, :track_id)
  end
end
