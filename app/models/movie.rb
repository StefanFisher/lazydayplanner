class Movie < ActiveRecord::Base
	#movies have many comments (bulds the join) and comments are also destroyed when movies are destroyed
	has_many :comments, dependent: :destroy
	validates :title, presence: true,length: {minimum: 2}
	serialize :actors
	serialize :directors
	serialize :genre
	serialize :poster
	serialize :writers

end
