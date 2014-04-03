class CreateGenreOverrideMovieOverrideTable < ActiveRecord::Migration
  def change
    create_table :genre_overrides_movie_overrides do |t|
    	t.integer :genre_overrides_id
    	t.integer :movie_overrides_id
    end
  end
end
