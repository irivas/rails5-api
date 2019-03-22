class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :update, :destroy]
  before_action :set_index_pagination, only: :index

  # GET /genres
  def index
    @genres = Genre.all.paginate(page: @page, per_page: @per_page)
    json_response_index(@genres, @page, @per_page)
  end

  # POST /genres
  def create
    @genre = Genre.create!(genre_params)
    json_response(@genre, :created)
  end

  # GET /genres/:id
  def show
    json_response(@genre)
  end

  # PUT /genres/:id
  def update
    @genre.update(genre_params)
    no_content_response
  end

  # DELETE /genres/:id
  def destroy
    @genre.destroy
    no_content_response
  end

  private
  def genre_params
    params.permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def set_index_pagination
    @page ||= params[:page] || 1
    @per_page ||= params[:per_page] || 5
  end
end
