class ChangeFieldFormatInActors < ActiveRecord::Migration

  def change
  	remove_column :actors, :movie_id
  	remove_column :actors, :actor_id
 
  end
end
