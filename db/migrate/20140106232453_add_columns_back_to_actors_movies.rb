class AddColumnsBackToActorsMovies < ActiveRecord::Migration
  def change
  	add_column :actors, :movie_id, :integer
  	add_column :actors, :actor_id, :integer
  end
end
