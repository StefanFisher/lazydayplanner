class MoviePref < ActiveRecord::Base
	validates :user_id, presence: true, uniqueness: {scope: :movie_id}
	belongs_to :user
	belongs_to :movie
end
