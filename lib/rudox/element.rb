

module Rudox
  # Module to be included into every docx document element
  module Element
    # Buffers (i.e files) that the element can write to
    # This is a hash keyed by symbols
    attr_reader :buffers
    
    # Real directory the buffers must be written to
    attr_accessor :realdir
    
    # Opens a buffer for this element
    def open_buffer(key, *subnames)
      buffer = Buffer.open(realdir, File.join(*subnames))
      return false, "Could not open file" unless buffer
      @buffers ||= {}
      @buffers[key.to_sym] = buffer
    end
    
    # Closes all buffers.
    def close_buffers
      @buffers ||= {}
      @buffers.each do | key, buffer |
        buffer.close
      end
    end
    
    # Closes all buffers.
    def close
      close_buffers
    end
    
  end
end