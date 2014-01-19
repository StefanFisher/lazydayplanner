class AddTitleAndYearToMovieOverrides < ActiveRecord::Migration
  def change
    add_column :movie_overrides, :title, :string
    add_column :movie_overrides, :year, :integer
  end
end
