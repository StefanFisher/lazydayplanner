class GenresController < ApplicationController

	def index
		@genres = Genre.all
	end

	def show
  		#instance variables get passed to the new
  		@genre = Genre.find(params[:id])
    end

end