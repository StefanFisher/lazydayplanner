class AddGenreOverrideIdToMovieOverrides < ActiveRecord::Migration
  def change
  	add_column :movie_overrides, :genre_override_id, :integer
  end
end
