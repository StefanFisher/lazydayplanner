class AddActorIdToRoles < ActiveRecord::Migration
  def change
  	add_column :roles, :actor_id, :integer
  end
end
