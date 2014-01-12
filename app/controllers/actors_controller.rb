class ActorsController < ApplicationController

	def index
    #Since the list can be hundred of lines, only show the actors for movies you own.
    #create an array for the actors for movies you own
		@actors = []
    #add the actors to the array. This is added as a 2d array. [movie][actors]
    current_user.movies.each do |x| @actors << x.actors end
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
