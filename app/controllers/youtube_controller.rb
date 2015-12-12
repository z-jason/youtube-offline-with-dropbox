class YoutubeController < ApplicationController

  before_filter :authenticate

  # GET http://localhost:3001/youtube/download_to_dropbox?url=https://www.youtube.com/watch?v=MNrZKiamgIw
  def download_to_dropbox
    if params[:url].present?
      render :text => YoutubeDownloader.download_to_dropbox(params[:url])
    else
      render :status => 404
    end
  end
  private

  def authenticate
    if params[:service_key] != Constant::SERVICE_KEY
      render :text => 'Unauthorized user'
    end
  end
end
