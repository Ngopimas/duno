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
      redirect_to edit_track_path(@track)
    else
      render :new
    end
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def edit
    @chapter = Chapter.find(params[:id])
    @track = @chapter.track
    @chapter_new = Chapter.new
    @name_url = params[:inputPassword2]
  end

  def update
    @chapter = Chapter.find(params[:id])
    @track = @chapter.track
    if @chapter.update(chapter_params)
      redirect_to edit_track_path(@chapter.track)
    else
      render :edit
    end
  end

  def move
    @chapter = Chapter.find(params[:id])
    @chapter.insert_at(params[:position].to_i)
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :content, :position)
  end
end
