module Grizzly
  class User

    def self.build_from_hash(hash)
      @options = user_options

    end

    def method_missing(method_name, *attrs)
      if @options.has_key?(method_name)
        return @options[method_name] 
      else
        raise("Current User does not have #{method_name}")
      end 
    end
  end
end
