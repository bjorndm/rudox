module Udomo
  class Network
    include Node
    
    # Generates a unique id of the form prefix number suffix
    def self.generate_id(prefix = 'id', suffix = '')
      @genid ||= 0
      @genid += 1
      return "#{prefix}#{@genid}#{suffix}".to_sym
    end
    
    # Resets the Id generator. This should probably only be used for unit 
    # testing.
    def self.reset_id_generator
      @genid = 0
    end
    
    
    
  end
end