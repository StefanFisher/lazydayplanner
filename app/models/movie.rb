class Movie < ActiveRecord::Base
	#movies have many comments (bulds the join) and comments are also destroyed when movies are destroyed
	has_many :comments, dependent: :destroy
	has_and_belongs_to_many :actors
	validates :title, presence: true,length: {minimum: 2}
	serialize :actors
	serialize :directors
	serialize :genre
	serialize :poster
	serialize :writers

	after_commit :populate_actors

	private
		def populate_actors
			parsed_actors = JSON.parse(self.actors_list)

			parsed_actors.each do |x| 
			actor = Actor.find_or_create_by(full: x)
			self.actors << actor
			end
		end

end
