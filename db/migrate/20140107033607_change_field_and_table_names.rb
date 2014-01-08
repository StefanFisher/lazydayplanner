class ChangeFieldAndTableNames < ActiveRecord::Migration
  def change
  	rename_table :genres_movies_tables, :genres_movies
  	rename_column :movies, :genre, :genre_list
  end
end
