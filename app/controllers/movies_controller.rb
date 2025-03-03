class MoviesController < ApplicationController
  before_action :set_movie, only: [:update, :destroy]

  # GET /movies
  def index
    page = params[:page] || 1
    cache_key = "movies_page_#{page}"

    movies = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      Movie.page(page).per(20).to_a.presence
    end

    if movies.present?
      render json: movies
    else
      render json: { message: "No movies found on this page" }, status: :not_found
    end
  end
  
  # GET /movies/:id
  def show
    cache_key = "movie_#{params[:id]}"

    @movie = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      Movie.find_by(id: params[:id])
    end

    if @movie
      render json: @movie
    else
      Rails.cache.delete(cache_key) # Prevent caching nil values
      render json: { error: "Movie not found", id: params[:id] }, status: :not_found
    end
  end

  # POST /movies
  def create
    movie = Movie.new(movie_params)
    if movie.save
      clear_movie_cache
      render json: movie, status: :created
    else
      render json: movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/:id
  def update
    if @movie.update(movie_params)
      clear_movie_cache
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/:id
  def destroy
    @movie.destroy
    clear_movie_cache
    head :no_content
  end

  private

  def set_movie
    @movie = Movie.find_by(id: params[:id])
    unless @movie
      Rails.cache.delete("movie_#{params[:id]}") # Prevent stale cache
      render json: { error: "Movie not found" }, status: :not_found
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :genre, :release_year, :director)
  end

  def clear_movie_cache
    redis = Redis.new
    redis.keys("movies_page_*").each { |key| redis.del(key) }
    redis.keys("movie_*").each { |key| redis.del(key) }
  end
end
