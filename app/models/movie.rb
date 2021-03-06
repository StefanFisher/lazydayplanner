class Movie < ActiveRecord::Base
	#movies have many comments (bulds the join) and comments are also destroyed when movies are destroyed
	has_many :comments, dependent: :destroy
	has_many :movie_overrides, dependent: :destroy
	has_and_belongs_to_many :actors
	has_and_belongs_to_many :genres
	has_and_belongs_to_many :users
	has_many :movie_prefs, dependent: :destroy
	validates :year, presence: true,length: {minimum: 4}
	validates :title, presence: true,length: {minimum: 2}, uniqueness: {scope: :year}

	after_commit :populate_actors
	after_commit :populate_genres

	private
		def populate_actors
			#use JSON.parse to look at the long string that is in the movie's actor_list
			#field. This will create an array of all the actors
			parsed_actors = JSON.parse(self.actors_list)
			#go through the array of actors and create a new actorrai
			parsed_actors.each do |x| 
				#if the actor does not exist, create a new one, if the ator is already in the DB, don't create it
				actor = Actor.find_or_create_by(full: x.keys[0])
				#now add the new actor object(or the actor that has already been created) to the intermediate table
				self.actors << actor
				#add the role of the actor tot he roles table
				x.values[0].each do |y|
					role = Role.find_or_create_by(full: y, movie: self.title)
					actor.roles << role
				end
			end
		end

		def populate_genres
			#in new api genres are already in array form, just read them
			parsed_genres = JSON.parse(self.genre_list)
			#go through the array of genres and create a new actor
			parsed_genres.each do |x| 
				#if the genre does not exist, create a new one, if the genre is already in the DB, don't create it
				genre = Genre.find_or_create_by(genre: x)
				#now add the new genre object(or the genre that has already been created) to the intermediate table
				self.genres << genre
			end
		end

end