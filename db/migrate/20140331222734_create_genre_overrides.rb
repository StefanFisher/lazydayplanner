class CreateGenreOverrides < ActiveRecord::Migration
  def change
    create_table :genre_overrides do |t|
      t.string :genre
      t.text :description
      t.integer :genre_id
      t.integer :user_id

      t.timestamps

    end
  end
end
