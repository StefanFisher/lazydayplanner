class MovieOverride < ActiveRecord::Base
	validates :user_id, presence: true, uniqueness: {scope: :movie_id}
	belongs_to :user
end
