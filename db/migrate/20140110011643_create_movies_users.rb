class CreateMoviesUsers < ActiveRecord::Migration
  def change
    create_table :movies_users, :id => false do |t|
    	t.integer :movie_id
    	t.integer :user_id
    end
  end
end
