class Role < ActiveRecord::Base
	#roles will get created with actors when a movie is added to the db
	belongs_to :actor

	before_save :fill_out_name


	private

		def fill_out_name
			skips = ["de","le","la","mc","mac", "von", "van"]
			arr = self.full.split(' ')
			case(self.full.count(' '))
				when 1
					self.first_name = arr[0]
					self.last_name= arr[1]
				when 2
					self.first_name=arr[0]
					skips.each do |x|
						if arr[1] != x
							self.middle_name=arr[1]
							self.last_name=arr[2]
						else
							self.last_name = arr[1]+" "+arr[2]
						end
					end
				when 3
					self.first_name=arr[0]
					skips.each do |x|
						if arr[2] != x && arr[3] != "Jr."
							self.middle_name=arr[1]+" "+arr[2]
							self.last_name=arr[3]
						else
							self.middle_name=arr[1]
							self.last_name = arr[2]+" "+arr[3]
						end
					end
			end
		end

end
