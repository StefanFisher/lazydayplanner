class RemovePostFromComments < ActiveRecord::Migration
  def change
    remove_reference :comments, :post, index: true
  end
end
