class VideoQualitiesController < ApplicationController
  before_action :set_video_quality, only: [:show, :update, :destroy]
  before_action :set_index_pagination, only: :index

  # GET /video_qualities
  def index
    @video_qualities = VideoQuality.all.paginate(page: @page, per_page: @per_page)
    json_response_index(@video_qualities, @page, @per_page)
  end

  # POST /video_qualities
  def create
    @video_quality = VideoQuality.create!(video_quality_params)
    json_response(@video_quality, :created)
  end

  # GET /video_qualities/:id
  def show
    json_response(@video_quality)
  end

  # PUT /video_qualities/:id
  def update
    @video_quality.update(video_quality_params)
    no_content_response
  end

  # DELETE /video_qualities/:id
  def destroy
    @video_quality.destroy
    no_content_response
  end

  private
  def video_quality_params
    params.permit(:name, :abbr, :position, :default)
  end

  def set_video_quality
    @video_quality = VideoQuality.find(params[:id])
  end

  def set_index_pagination
    @page ||= params[:page] || 1
    @per_page ||= params[:per_page] || 5
  end
end
