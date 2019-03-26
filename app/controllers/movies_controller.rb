class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]
  before_action :set_index_pagination, only: :index

  # GET /movies
  def index
    @movies = Movie.all.paginate(page: @page, per_page: @per_page)
    json_response_index(@movies, @page, @per_page)
  end

  # POST /movies
  def create
    @movie = Movie.create!(movie_params)
    json_response(@movie, :created)
  end

  # GET /movies/:id
  def show
    json_response(@movie)
  end

  # PUT /movies/:id
  def update
    @movie.update(movie_params)
    no_content_response
  end

  # DELETE /movies/:id
  def destroy
    @movie.destroy
    no_content_response
  end

  private
  def movie_params
    params.permit(:title, :year, :plot, :duration, video_quality_ids: [])
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_index_pagination
    @page ||= params[:page] || 1
    @per_page ||= params[:per_page] || 5
  end
end
