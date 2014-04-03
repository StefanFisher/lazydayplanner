class GenresController < ApplicationController

	def index
		@genres = Genre.all
		@override = current_user.genre_overrides
	end

	def show
  		#instance variables get passed to the new
  		@overrides = current_user.genre_overrides

  		if @overrides.exists?(:genre_id => params[:id])
  			@genre = @overrides.find_by(:genre_id => params[:id]) 
  		else
  			@genre = Genre.find(params[:id])
        @movies = current_user.movie_overrides
  		end

  		@real_genre = Genre.find(params[:id])
    end

end