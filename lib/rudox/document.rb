require 'tmpdir'
require 'fileutils'


module Rudox
  class Document
    include Rudox::Element
  
    attr_reader :filename
  
    # Initializes the document with the filename it should finally get
    def initialize(filename)
      @filename = filename
    end
  
    def open
      self.realdir = Dir.mktmpdir("#{@filename}.rudox.")
      # Minimal buffers as per wordpad...
      open_buffer(:content_types, '[Content_Types].xml')
      open_buffer(:rels, '_rels', '.rels')
      open_buffer(:document_rels, 'word', '_rels', 'document.xml.rels')
      open_buffer(:document, 'word', 'document.xml')
      open_buffer(:styles, 'word', 'styles.xml')
      open_buffer(:numbering, 'word', 'numbering.xml')
    end
  
    # Closes the document and finalizes it. 
    def close
      close_buffers
      # Zip it all up using the zip command for now :p
      pwd = Dir.pwd
      Dir.cd(realdir)
      exec("zip -r #{filename} *")
      Dir.cd(pwd)
      FileUtils.rm_r(realdir)
    end
    
  end
end