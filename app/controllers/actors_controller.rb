class ActorsController < ApplicationController

	def index
		@actors = Actor.all
	end

	def show
  		#instance variables get passed to the new
  		@actor = Actor.find(params[:id])
    end

    def destroy
   		@actor = Actor.find(params[:id])
    	@actor.destroy
    	redirect_to '/actors'
  	end
 

end
