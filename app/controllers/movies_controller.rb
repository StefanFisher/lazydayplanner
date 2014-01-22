require "APISearch"
class MoviesController < ApplicationController
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index,:show]
  def index
    #show only the movies the current user owns
  	@movies = current_user.movies
    @override = current_user.movie_overrides
  end

  def new
  	#sends the movie objest back to new if the validation fails
    @movie = Movie.new

    if params[:search].present?
      search
      #render 'search'
    end

  end

  def create

  	#render text: params[:movie].inspect
  	@movie = Movie.new(movie_params)
  	if @movie.save
      #attach the current user the owner of the added movie
      @movie.users << current_user
      #create an entry for the user to set up preferences in the show view
      MoviePref.create(:user_id => current_user.id, :movie_id => @movie.id)
  		redirect_to @movie
  	else
  		render 'new'
  	end

  end

  def show
    overrides = current_user.movie_overrides
  	@movie = overrides.exists?(:movie_id => params[:id]) ? overrides.where(:movie_id => params[:id]).first : Movie.find(params[:id])
    #get the preferences for the movie
    pref = MoviePref.where(:movie_id => params[:id], :user_id => current_user.id).first
    #if the movie doesn;t have preferences go ahead and create blank ones, else, pull them
    @pref = pref.nil? ? MoviePref.create(:user_id => current_user.id, :movie_id => @movie.id) : pref
    @real_movie = Movie.find(params[:id])
  end

  def edit

  	@movie = Movie.find(params[:id])

  end

  def update
    @movie = Movie.find(params[:id])
 
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end

def search

  if(titleExist?)
    redirect_to show
  else
    @search = APISearch.new(params[:search])
    #@movie = Movie.new
    @multi = @search.MultiSearch(params[:search],5)
    render 'search'
  end
end

def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
 	#since we are redirecting to the index we don;t need to create a view
  redirect_to '/movies'
end


  private

  def movie_params

  	params.require(:movie).permit(:title,:text, :year, :plot_simple, :genre_list,
      :actors_list, :directors, :writers, :poster, :rated,
      :rating, :runtime, :release_date, :film_location, :imdb_url)

  end

end
