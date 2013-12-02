module APISearch
	
	def titlesearch(title)

		response_string = HTTParty.get("http://mymovieapi.com/",:query => {:title => title, :type => 'json'})
		@response = JSON.parse(response_string)

	end

end