class AddMovieReferencesToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :movie, index: true
  end
end
