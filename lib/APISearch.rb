class APISearch

	attr_reader :title, :actors, :directors, :film_location, :genre, :imdb_id, :plot, :plot_simple, :poster, :rated, :rating, :runtime, :release_date, :writers, :year 

	def initialize(title)

		TitleSearch(title)

		@title = @response[0]['title']
		@actors = @response[0]['actors']
		@directors = @response[0]['directors']
		@film_location = @response[0]['film_location']
		@genre = @response[0]['genres']
		@imdb_id = @response[0]['imdb_id']
		@plot = @response[0]['plot']
		@plot_simple = @response[0]['plot_simple']
		@poster = @response[0]['poster']
		@rated = @response[0]['rated']
		@rating = @response[0]['rating']
		@runtime = @response[0]['runetime']
		@release_date = @response[0]['release_date']
		@writers = @response[0]['writers']
		@year = @response[0]['year']


	end

	
	def TitleSearch(title)

		response_string = HTTParty.get("http://mymovieapi.com/",:query => {:title => title, :type => 'json'})
		@response = JSON.parse(response_string)

	end

	def MultiSearch(title,limit=1)

		response_string = HTTParty.get("http://mymovieapi.com/",:query => {:title => title, :limit => limit, :type => 'json'})
		@response = JSON.parse(response_string)

	end

end