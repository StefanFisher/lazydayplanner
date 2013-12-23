class AddDetailsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :actors, :text
    add_column :movies, :directors, :text
    add_column :movies, :film_location, :string
    add_column :movies, :genre, :text
    add_column :movies, :imdb_id, :string
    add_column :movies, :plot_simple, :text
    add_column :movies, :poster, :text
    add_column :movies, :rated, :string
    add_column :movies, :rating, :decimal
    add_column :movies, :runtime, :string
    add_column :movies, :release_date, :integer
    add_column :movies, :writers, :text
  end
end
