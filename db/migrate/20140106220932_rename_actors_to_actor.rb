class RenameActorsToActor < ActiveRecord::Migration
  def change
  	rename_table :actors, :actor
  end
end
