class AudioQualitiesController < ApplicationController
  before_action :set_audio_quality, only: [:show, :update, :destroy]

  # GET /audio_qualities
  def index
    @audio_qualities = AudioQuality.all
    json_response(@audio_qualities)
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
    head :no_content
  end

  # DELETE /audio_qualities/:id
  def destroy
    @audio_quality.destroy
    head :no_content
  end

  private
  def audio_quality_params
    params.permit(:name, :abbr, :position, :default)
  end

  def set_audio_quality
    @audio_quality = AudioQuality.find(params[:id])
  end
end
