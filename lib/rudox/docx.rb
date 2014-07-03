

require 'zip'
require 'zip/filesystem'

# Docx models a doxc document
module Rudox
  class Docx
    
    def initialize
      # a docx document is actually an archive of files zipped together
      @file_list = {} 
    end
    
    def load_filename(fname)
      Zip::File.open(fname) do | zipfile |
        p "zipfile", zipfile
        first = true
        zipfile.each do | subfile |
          if first 
            p subfile.methods.sort - Object.methods
            first = false
          end
          p "subfile", subfile
        end
      end
    end
    
    def self.load_filename(fname)
      docx = Docx.new
      docx.load_filename(fname)
      return docx
    end
    
  end
end


