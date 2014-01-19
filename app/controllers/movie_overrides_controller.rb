class MovieOverridesController < ApplicationController

  def index
    #show only the movies the current user owns
  	@movie_override = current_user.movie_overrides

  end

	def new
  		#sends the movie objest back to new if the validation fails
    	@movie_override = MovieOverride.new
    	@movie = Movie.find(params[:id])
  	end

  def create
  	#render text: params[:movie].inspect
  	@movie_override = MovieOverride.new(movie_override_params)
  	if @movie_override.save
  		@movie = Movie.find(@movie_override.movie_id)
  		redirect_to @movie
  	else
  		render 'new'
  	end

  end

  def show
  	#instance variables get passed to the new
  	@movie_override = MovieOverride.find(params[:id])
  end

  def edit

  	@movie_override = MovieOverride.find(params[:id])

  end

  def update
    @movie_override = MovieOverride.find(params[:id])
 
    if @movie_override.update(movie_override_params)
    	@movie = Movie.find(@movie_override.movie_id)
      	redirect_to @movie
    else
      render 'edit'
    end
  end

  private

  def movie_override_params

  	params.require(:movie_override).permit(:movie_id, :user_id, :title,:text, :year, :plot_simple,
  		:directors, :writers, :poster, :rated, :rating, :runtime, :release_date, 
  		:film_location, :imdb_url)

  end

end
