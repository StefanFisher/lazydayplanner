class RemoveFieldsActorsMovies < ActiveRecord::Migration
  def change
  	remove_column :actors_movies, :actor_id_id
  	remove_column :actors_movies, :movies_id_id
  end
end
