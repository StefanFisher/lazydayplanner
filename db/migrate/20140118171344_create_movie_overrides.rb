class CreateMovieOverrides < ActiveRecord::Migration
  def change
    create_table :movie_overrides do |t|
    	t.integer :movie_id
    	t.integer :user_id
    	t.text :directors
    	t.string :film_location
    	t.string :imdb_id
    	t.text :plot_simple
    	t.text :poster
    	t.string :rated
    	t.decimal :rating
    	t.string :runtime
    	t.integer :release_date
    	t.text :writers
    end
  end
end
