class GenreOverride < ActiveRecord::Base
	validates :user_id, presence: true, uniqueness: {scope: :genre_id}
	belongs_to :user
	#belongs_to :genre
	has_and_belongs_to_many :movie_overrides

	after_save :create_new_movie_override


	def create_new_movie_override
		old_genre = Genre.find(self.genre_id)
		user_overrides = User.find(self.user_id).movie_overrides

		old_genre.movies.each do |movie|
			if user_overrides.exists?(:movie_id => movie.id)
				attributes = {:movie_id => movie.id,
				:user_id => self.user_id}
			else
				attributes = {
					:movie_id => movie.id,
					:user_id => self.user_id,
					:title => movie.title,
					:year => movie.year,
					:plot_simple => movie.plot_simple,
					:directors => movie.directors,
					:writers => movie.writers,
					:poster => movie.poster,
					:rated => movie.rated,
					:rating => movie.rating,
					:runtime => movie.runtime,
					:release_date => movie.release_date,
					:film_location => movie.film_location,
					:imdb_url => movie.imdb_url
				}
			end

			newOverride = MovieOverride.find_or_initialize_by(:movie_id => movie.id,:user_id => self.user_id,)
			newOverride.update(attributes)
			self.movie_overrides << newOverride
		end

	end

end
