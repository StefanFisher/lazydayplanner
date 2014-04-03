class GenreOverridesController < ApplicationController

  def index
    #show only the mgenress the current user owns
  	@genre_override = current_user.genre_overrides

  end

	def new
    	@genre_override = GenreOverride.new
    	@genre = Genre.find(params[:id])
  	end

  def create
  	@genre_override = GenreOverride.new(genre_override_params)
  	if @genre_override.save
  		#@genre_override = GenreOverride.find(@genre_override.genre_id)
  		redirect_to @genre_override
  	else
  		render 'new'
  	end

  end

  def show
  	#instance variables get passed to the new
  	@genre_override = GenreOverride.find(params[:id])
  end

  def edit

  	@genre_override = GenreOverride.find(params[:id])

  end

  def update
    @genre_override = GenreOverride.find(params[:id])
 
    if @genre_override.update(genre_override_params)
    	@genre = Genre.find(@genre_override.genre_id)
      	redirect_to @genre
    else
      render 'edit'
    end
  end

  private

  def genre_override_params

  	params.require(:genre_override).permit(:genre_id, :user_id, :genre, :description)

  end

end