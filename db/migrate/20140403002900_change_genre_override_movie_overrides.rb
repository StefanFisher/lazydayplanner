class ChangeGenreOverrideMovieOverrides < ActiveRecord::Migration
  def change
  	rename_column :genre_overrides_movie_overrides, :genre_overrides_id, :genre_override_id
  	rename_column :genre_overrides_movie_overrides, :movie_overrides_id, :movie_override_id
  end
end
