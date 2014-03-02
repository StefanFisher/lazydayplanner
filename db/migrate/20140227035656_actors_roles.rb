class ActorsRoles < ActiveRecord::Migration
  def change
  	create_table :actors_roles, :id => false do |t|
    	t.integer :actor_id
    	t.integer :role_id
    end
  end
end
