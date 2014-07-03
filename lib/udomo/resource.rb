module Udomo
  class Resource
    include Node
    attr_reader :id
    attr_reader :url
    
    def initialize(url)
      super(Network.generate_id("resource_"))
      @url = url
       # Creates a new empty view.
    end
    
  end
end