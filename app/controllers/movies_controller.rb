require "APISearch"
class MoviesController < ApplicationController
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index,:show]
  def index

  	@movies = Movie.all

  end

  def new
  	#sends the movie objest back to new if the validation fails
  	@movie = Movie.new

    if params[:search].present?
      search
      render 'search'
    end

  end

  def create

  	#render text: params[:movie].inspect
  	@movie = Movie.new(movie_params)
  	if @movie.save
  		redirect_to @movie
  	else
  		render 'new'
  	end

  end

  def show
  	#instance variables get passed to the new
  	@movie = Movie.find(params[:id])
  end

  def edit

  	@movie = Movie.find(params[:id])

  end

  def update
  @movie = Movie.find(params[:id])
 
  if @movie.update(params[:movie].permit(:title, :text))
    redirect_to @movie
  else
    render 'edit'
  end
end

def search

@movie = Movie.new

@search = APISearch.new(params[:search])

@multi = @search.MultiSearch(params[:search],5)

end

def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
 	#since we are redirecting to the index we don;t need to create a view
  redirect_to '/movies'
end


  private

  def movie_params

  	params.require(:movie).permit(:title,:text, :year, :plot_simple, :genre,
      :actors, :directors, :writers, :poster, :rated,
      :rating, :runtime, :release_date, :film_location)

  end

end
