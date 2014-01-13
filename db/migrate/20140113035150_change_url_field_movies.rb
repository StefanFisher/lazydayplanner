class ChangeUrlFieldMovies < ActiveRecord::Migration
  def change
  	rename_column :movies, :imbd_url, :imdb_url
  end
end
