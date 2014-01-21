class CreateActorOverrides < ActiveRecord::Migration
  def change
    create_table :actor_overrides do |t|
      t.string :full
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :actor_id
      t.integer :user_id

      t.timestamps
    end
  end
end
