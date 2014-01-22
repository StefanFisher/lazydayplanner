class MoviePrefsController < ApplicationController

	def new
    	@movie_prefs = MoviePref.new
  	end

  def create
  	#render text: params[:movie].inspect
  	@movie_prefs = MoviePref.new(movie_prefs_params)
  	if @movie_prefs.save
  		@movie = Movie.find(@movie_prefs.movie_id)
  		redirect_to @movie
  	else
  		render 'new'
  	end

  end

  def edit

  	@movie_prefs = MoviePref.find(params["movie_pref"][:id])

  end

  def update
    @movie_prefs = MoviePref.find(params["movie_pref"][:id])
 
    if @movie_prefs.update(movie_prefs_params)
    	@movie = Movie.find(@movie_prefs.movie_id)
      	redirect_to @movie
    else
      render 'edit'
    end
  end

  private

  def movie_prefs_params

  	params.fetch(:movie_pref, {}).permit(:movie_id, :user_id, :dvd, :bluray, :digital,
  		:location, :lent_to)

  end

end
