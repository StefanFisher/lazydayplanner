class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :full
      t.string :first
      t.string :last

      t.timestamps
    end
  end
end
