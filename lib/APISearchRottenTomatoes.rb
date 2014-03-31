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
		#the actors come in asan array of hashes, but it has info I dont need
		#break the hash down into an array of just actors
		actor_array = @response['movies'][0]['abridged_cast'].map do |x| x['name'] end
		#break the hash down into an array of the actors roles
		role_array = @response['movies'][0]['abridged_cast'].map do |x| x['characters'] end
			#combine the arrays into one big hash
			actors_roles_hash = Hash[actor_array.zip(role_array)]
			#now break the big hash out into an array of smaller hashes
			array_of_hashes = actors_roles_hash.map do |k,v| Hash[k,v] end
		@actors = array_of_hashes.to_json
		#@film_location = @response[0]['film_location']
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

		#get the details from aanother API call
		DetailSearch(@imdb_id)

		@genre = @detail_response['genres']
		@directors = @detail_response['abridged_directors'][0]['name'][0] #only pulls first director

		if @plot_simple == "" 
			imdb_call = IMDBSearch(@title)
			@plot_simple = imdb_call['Plot']
		end

	end

	
	def TitleSearch(title)

		response_string = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=3exp2hc3hykfqg8u4g8gudpx",:query => {:q => title, :page_limit => 1, :type => 'json'})
		@response = response_string

	end

	def MultiSearch(title,limit=1)

		response_string = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=3exp2hc3hykfqg8u4g8gudpx",:query => {:q => title, :page_limit => limit, :type => 'json'})
		@response = response_string

	end

	def DetailSearch(rt_movie_id)
		response_string = HTTParty.get("http://api.rottentomatoes.com/api/public/v1.0/movies/" + rt_movie_id + ".json?apikey=3exp2hc3hykfqg8u4g8gudpx")
		@detail_response = response_string
	end

	def IMDBSearch(title)
		#imdb search for the plot since Rotten Tomatoes doesn't have the rights to
		#old summaries
		imdb = HTTParty.get("http://www.omdbapi.com/", :query => {:t => @title, :y => @year})
		return JSON.parse(imdb)
	end

end