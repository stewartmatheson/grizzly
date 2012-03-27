module Grizzly
  class Cursor
    include Enumerable
    ITEMS_PER_PAGE = 50

    def initialize(domain_object, url, options, items_per_page = ITEMS_PER_PAGE)
      @domain_object, @url, @options, @items_per_page = domain_object, url, options, items_per_page
      @current_page = 1
      fetch_current_page
    end

    #Each will return the first page of results
    def each(&block)
      @items.each { |i| block.call i }  
    end

    #Next page will return the result set 
    def next_page(&block)
      @items.each { |i| block.call i }
      @current_page += 1
      fetch_current_page
    end

    def next_page?
      (@current_page * @items_per_page) < @total_items
    end

    private 
    
    def page_request(url, options)
      request = Grizzly::Request.new(:get, url, options)
      request.response
    end

    def fetch_current_page
      options = @options.merge({ :page => @current_page, :count => @items_per_page })
      response = page_request(@url, options)
      @total_items = response["total_number"]

      @items = []
      response[@domain_object::API_COLLECTION_NAME].each do |domain_object|
        @items << @domain_object.new(domain_object) 
      end
    end

  end
end
