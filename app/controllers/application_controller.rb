class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #force user to be logged in
  before_action :authenticate_user!

  	def titleExist?
		movies = Movie.all
		movies.each do |movie|
			if (movie.title.downcase == params[:search].downcase)
				params[:id] = movie.id
				return true
			end
		end

		return false

	end

	def addOwnership
		movie = Movie.find(params[:movie_id])
		movie.users << current_user
		redirect_to(:action=>'index')
	end

end