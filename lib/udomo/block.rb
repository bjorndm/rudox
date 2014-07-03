

# Basic blocks
require_relative 'block/basic'
require_relative 'block/box'

# Normal text flow. Lines are not meaningful.
require_relative 'block/text'
require_relative 'block/paragraph'
require_relative 'block/section'

# Tables
require_relative 'block/cell'
require_relative 'block/row'
require_relative 'block/table'

# Lists
require_relative 'block/list'

# Media
require_relative 'block/image'

# Source code and poetry, where newlines are meaningful.
require_relative 'block/line'
require_relative 'block/listing'
require_relative 'block/poetry'

# Caption or heading of a section, paragraph, image, etc
require_relative 'block/caption'

# Main parts of a normal document
require_relative 'block/front'
require_relative 'block/toc'
require_relative 'block/main'
require_relative 'block/index'
require_relative 'block/header'
require_relative 'block/footer'
require_relative 'block/back'

# Links
require_relative 'block/anchor'
require_relative 'block/link'
require_relative 'block/hyperlink'

# Calculated values and formulas
require_relative 'block/property'
require_relative 'block/expression'


module Udomo
  # A document consists of one or more blocks,
  # which in turn may contain one or more sub-blocks
  module Block
    include Node
    
    # Creates a new empty block.
    def initialize
      super(Network.generate_id("block_"))
    end
  end
end