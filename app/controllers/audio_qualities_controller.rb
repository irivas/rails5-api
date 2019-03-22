class AudioQualitiesController < ApplicationController
  before_action :set_audio_quality, only: [:show, :update, :destroy]
  before_action :set_index_pagination, only: :index

  # GET /audio_qualities
  def index
    @audio_qualities = AudioQuality.all.paginate(page: @page, per_page: @per_page)
    json_response_index(@audio_qualities, @page, @per_page)
  end

  # POST /audio_qualities
  def create
    @audio_quality = AudioQuality.create!(audio_quality_params)
    json_response(@audio_quality, :created)
  end

  # GET /audio_qualities/:id
  def show
    json_response(@audio_quality)
  end

  # PUT /audio_qualities/:id
  def update
    @audio_quality.update(audio_quality_params)
    no_content_response
  end

  # DELETE /audio_qualities/:id
  def destroy
    @audio_quality.destroy
    no_content_response
  end

  private
  def audio_quality_params
    params.permit(:name, :abbr, :position, :default)
  end

  def set_audio_quality
    @audio_quality = AudioQuality.find(params[:id])
  end

  def set_index_pagination
    @page ||= params[:page] || 1
    @per_page ||= params[:per_page] || 5
  end
end
