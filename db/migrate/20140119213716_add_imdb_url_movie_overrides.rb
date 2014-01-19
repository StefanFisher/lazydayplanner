class AddImdbUrlMovieOverrides < ActiveRecord::Migration
  def change
  	add_column :movie_overrides, :imdb_url, :string
  end
end
