class Movie < ActiveRecord::Base
	#movies have many comments (bulds the join) and comments are also destroyed when movies are destroyed
	has_many :comments, dependent: :destroy
	has_and_belongs_to_many :actors
	validates :title, presence: true,length: {minimum: 2}
	serialize :directors
	serialize :genre
	serialize :poster
	serialize :writers

	after_commit :populate_actors

	private
		def populate_actors
			#use JSON.parse to look at the long string that is in the movie's actor_list
			#field. This will create an array of all the actors
			parsed_actors = JSON.parse(self.actors_list)
			#go through the array of actors and create a new actor
			parsed_actors.each do |x| 
				#if the actor does not exist, create a new one, if the ator is already in the DB, don't create it
				actor = Actor.find_or_create_by(full: x)
				#now add the new actor object(or the actor that has already been created) to the intermediate table
				self.actors << actor
			end
		end

end
