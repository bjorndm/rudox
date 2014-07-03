module Udomo
  class Document
    include Node
    
    # The currently active view for the document
    attr_reader :view

    # The currently active layout for the document
    attr_reader :layout
    
    # Creates a new empty document.
    def initialize
      super(Network.generate_id("document_"))
      @view     = View.new
      @layout   = Layout.new
      self.link(:default_view, @view)
      self.link(:default_layout, @layout)
    end
    
    
  end
end