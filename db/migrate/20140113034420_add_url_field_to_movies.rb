class AddUrlFieldToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :imbd_url, :string
  end
end
