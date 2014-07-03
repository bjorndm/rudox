module Udomo
  class Network
    include Node
    
    # Generates a unique id of the form prefix number suffix
    def self.generate_id(prefix = 'id', suffix = '')
      @genid ||= 0
      @genid += 1
      return "#{prefix}#{@genid}#{suffix}".to_sym
    end
    
    
    
  end
end