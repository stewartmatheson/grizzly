module Grizzly
  class Base

    def initialize(data)
      @data = data
    end

    def method_missing(method_name, *attrs)
      if @data.has_key?(method_name.to_s)
        return @data[method_name.to_s] 
      else
        raise("No data for: #{method_name}")
      end 
    end

    def to_h
      @data
    end

  end
end
