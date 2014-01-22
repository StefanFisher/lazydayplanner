class CreateMoviePrefs < ActiveRecord::Migration
  def change
    create_table :movie_prefs do |t|
    	t.integer :movie_id
    	t.integer :user_id
    	t.boolean :dvd
    	t.boolean :bluray
    	t.boolean :digital
    	t.integer :personal_rating
    	t.string :location
    	t.string :lent_to

      t.timestamps
    end
  end
end
