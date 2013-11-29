class MoviesController < ApplicationController
  def index
  end

  def new
  end

  def create
  	
  	render text: params[:movie].inspect

  end

end
