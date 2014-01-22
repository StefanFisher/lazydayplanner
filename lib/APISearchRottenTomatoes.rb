class APISearchRottenTomatoes

	attr_reader :title, :actors, :directors, :film_location, :genre, :imdb_id, 
	:plot, :plot_simple, :poster, :rated, :rating, :runtime, :release_date, 
	:writers, :year, :imdb_url

	#link that worked in httparty
	#"http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=3exp2hc3hykfqg8u4g8gudpx"

	def initialize(title)
		apikey = "3exp2hc3hykfqg8u4g8gudpx"
		baseURL = "http://api.rottentomatoes.com/api/public/v1.0"

		@moviesSearchUrl = baseURL + "/movies.json?apikey=" + apikey

		TitleSearch(title)

		@title = @response['movies'][0]['title']
		#@actors = @response[0]['actors']
		#@directors = @response[0]['directors']
		#@film_location = @response[0]['film_location']
		#@genre = @response[0]['genres']
		@imdb_id = @response['movies'][0]['id']
		#@plot = @response[0]['plot']
		@plot_simple = @response['movies'][0]['synopsis']
		@poster = @response['movies'][0]['posters']['detailed']
		@rated = @response['movies'][0]['mpaa_rating']
		@rating = @response['movies'][0]['ratings']['critics_score']
		@runtime = @response['movies'][0]['runetime']
		@release_date = @response['movies'][0]['release_dates']['theater']
		#@writers = @response[0]['writers']
		@year = @response['movies'][0]['year']
		@imdb_url = @response['movies'][0]['links']['alternate']


	end

	
	def TitleSearch(title)

		response_string = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=3exp2hc3hykfqg8u4g8gudpx",:query => {:q => title, :page_limit => 1, :type => 'json'})
		@response = response_string

	end

	def MultiSearch(title,limit=1)

		response_string = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=3exp2hc3hykfqg8u4g8gudpx",:query => {:q => title, :page_limit => limit, :type => 'json'})
		@response = response_string

	end

end