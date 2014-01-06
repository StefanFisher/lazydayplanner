class ChangeActorColumnNameMovies < ActiveRecord::Migration
  def change
  	rename_column :movies, :actors, :actors_list
  end
end
