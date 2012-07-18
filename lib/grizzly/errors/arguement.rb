module Grizzly
	module Errors
		class Arguement < StandardError
			def initialize
				@errors = []
			end

			def to_s
				"End point has been called with the incorrect parameters" << @errors.join(", ")
			end

			def add_error error
				@errors << error
			end
		end
	end
end
