module Rudox
  
  class Buffer
    # IO object for writing to.
    attr_reader :io
    # Real directory where we are constructing the file for later zippping
    attr_reader :realdir
    # Name within the zip archive
    attr_reader :subname
    
    def initialize()
      @io       = nil
      @realdir  = nil
      @subname  = nil
    end
    
    # Opens the buffer
    def open(realdir, subname)
      full_name = File.join(realdir, subname)
      dir       = File.dirname(full_name)
      Dir.mkdir(dir) unless Dir.exist?(dir)
      # Need to make the dir in case it doesn't yet exist.
      @io      = File.open(File.join(realdir, subname), 'wt') rescue nil
      return nil unless @io
      @realdir = realdir
      @subname = subname
      return self
    end
    
    # Closes the buffer
    def close()
      @io.close
      initialize()
    end
    
    # Writes to the buffer
    def <<(*args)
      @io << args
      return self
    end
    
    # Creates a new, opened buffer.
    def self.open(realdir, subname)
      buffer = Buffer.new
      return buffer.open(realddir, subname)
    end
  end
end