class CreateActorsMovies < ActiveRecord::Migration
  def change
    create_table :actors_movies, :id => false do |t|
    	t.references :actor_id
    	t.references :movie_id
    end
  end
end
