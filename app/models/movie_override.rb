class MovieOverride < ActiveRecord::Base
	validates :user_id, presence: true, uniqueness: {scope: :actor_id}
	belongs_to :user
end
