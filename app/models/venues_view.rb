class VenueView < ActiveRecord::Base
	belongs_to :venue

	self.primary_key = "venue_id"

	self.table_name = 'venues_view'

	def readonly?
		true
	end

	def self.refresh
    ActiveRecord::Base.connection.execute('REFRESH VIEW venues_view')
  end

end
