class AddDetailsToActor < ActiveRecord::Migration
  def change
  	add_column :actors, :middle_name, :string
  	rename_column :actors, :first, :first_name
  	rename_column :actors, :last, :last_name
  end
end
