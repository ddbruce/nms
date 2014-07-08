class MediasController < ApplicationController

  def index
    @media = Media.all
  end

  def show
    @media = Media.find(params[:id])
    @media_type = MediaTypes.find_by_id(@media.media_type).type_name
  end

  def new
    if !params.has_key? :upload_media_type
      @upload_media_type = MediaTypes.find_by_type_name("Photo")
    else
      @upload_media_type = MediaTypes.find_by_type_name(params[:upload_media_type])
    end
  end

  def create
    @media = Media.create_using_upload_type(params, current_user)

    if @media
      if @media.save
        redirect_to media_path(@media)
      end
    else 
      redirect_to medias_path
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @media = Media.find(params[:id])
    @media.destroy

    redirect_to medias_path
  end
  
end
