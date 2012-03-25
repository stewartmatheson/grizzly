module Grizzly
  class User

    def initialize(user_data)
      @data = user_data
    end

    def method_missing(method_name, *attrs)
      if @data.has_key?(method_name.to_s)
        return @data[method_name.to_s] 
      else
        raise("Current User does not have #{method_name}")
      end 
    end

  end
end
