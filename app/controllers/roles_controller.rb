class RolesController < ApplicationController
	#roles will get created with actors when a movie is added to the db
	def create
   		@actor = Actor.find(params[:actor_id])
    	@role = @actor.roles.create(params[:role].permit(:full, :first_name,
    	 :middle_name, :last_name))
    	redirect_to actor_path(@actor)
  	end

	def destroy
    	@actor = Actor.find(params[:actor_id])
    	@role = @actor.roles.find(params[:id])
    	@role.destroy
    	redirect_to actor_path(@actor)
  	end
end
