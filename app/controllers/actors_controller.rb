class ActorsController < ApplicationController

	def index
		@actors = Actor.all
	end

	def show
  		#instance variables get passed to the new
  		@actor = Actor.find(params[:id])
    end

end
