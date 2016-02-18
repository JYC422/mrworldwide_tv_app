class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(self.video_params)
    if @video.save
      redirect_to videos_path
    else
      render :new
    end
  end

  def video_params
    params.require(:video).permit(
        :id,
        :title,
        :album,
        :embed_url,
        :featured_artists,
        :tags,
        :released_on
    )
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params.require(:video).permit(
    :id,
    :title,
    :album,
    :embed_url,
    :featured_artists,
    :tags,
    :released_on
    ))
      redirect_to videos_path
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_path
  end

end
