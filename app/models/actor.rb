class Actor < ActiveRecord::Base
	has_and_belongs_to_many :movies

	before_save :fill_out_name


	private

		def fill_out_name
			arr = self.full.split(' ')
			case(self.full.count(' '))
				when 1
					self.first_name = arr[0]
					self.last_name= arr[1]
				when 2
					self.first_name=arr[0]
					self.middle_name=arr[1]
					self.last_name=arr[2]
				when 3
					self.first_name=arr[0]
					self.middle_name=arr[1]+arr[2]
					self.last_name=arr[4]
			end
		end	
end
