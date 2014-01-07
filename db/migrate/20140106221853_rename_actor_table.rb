class RenameActorTable < ActiveRecord::Migration
  def change
  	rename_table :actor, :actors
  end
end
