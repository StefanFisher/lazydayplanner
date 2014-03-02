class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :full
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :movie

      t.timestamps
    end
  end
end
