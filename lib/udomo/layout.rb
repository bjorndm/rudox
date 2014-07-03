module Udomo
  class Layout
    include Node
    
    #  Creates a new empty view.
    def initialize
      super(Network.generate_id("view_"))
    end
    
  end
end