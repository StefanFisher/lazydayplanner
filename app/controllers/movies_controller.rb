class MoviesController < ApplicationController
  def index
  end

  def new
  end

  def create

  	#render text: params[:movie].inspect
  	@movie = Movie.new(movie_params)
  	@movie.save
  	redirect_to @movie

  end

  def show
  	#instance variables get passed to the new
  	@movie = Movie.find(params[:id])

  end

  private

  def movie_params

  	params.require(:movie).permit(:title,:text)

  end

end
