class MoviesController < ApplicationController
  include APISearch
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index,:show]

  def index

  	@movies = Movie.all

  end

  def new
  	#sends the movie objest back to new if the validation fails
  	@movie = Movie.new
  end

  def create

  	#render text: params[:movie].inspect
  	@movie = Movie.new(movie_params)
  	#if statement determines whether to save the entry or send back to user
  	if @movie.save
  		redirect_to @movie
  	else
  		render 'new'
  	end

  end

  def show
  	#instance variables get passed to the new
  	@movie = Movie.find(params[:id])

  end

  def edit

  	@movie = Movie.find(params[:id])

  end

  def update
  @movie = Movie.find(params[:id])
 
  if @movie.update(params[:movie].permit(:title, :text))
    redirect_to @movie
  else
    render 'edit'
  end
end

def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
 	#since we are redirecting to the index we don;t need to create a view
  redirect_to movies_path
end

def search

  @search = titlesearch(params[:title])

  end


  private

  def movie_params

  	params.require(:movie).permit(:title,:text)

  end

end
