module Udomo
  module Node
    attr_reader :network
    attr_reader :id
    attr_reader :links
    
    def initialize(id)
      @id       = id
      @links    = {}
    end
    
    def link(link_type, node)
      @links[link_type.to_sym] = node
    end
    
    # First child if any
    def child
      return @links[:child]
    end
    
    # Parent node if any
    def parent
      return @links[:parent]
    end
    
    # Next sibling if any
    def next_sibling
      return @links[:next_sibling]
    end
    
    # Previous sibling if any
    def previous_sibling
      return @links[:previous_sibling]
    end
    
    # Links the node other as the next sibling of self
    # If there already is a sibling, otherwill be slipped in between
    # self and that old next sibling
    def add_sibling(other)
      if self.next_sibling
        old_sibling = self.next_sibling
        old_sibling.link(:previous_sibling, other)
        other.link(:next_sibling, old_sibling)
      end
      self.link(:next_sibling, other)
      other.link(:previous_sibling, self)
    end
    
    
    # Find the last sibling of self, by following next_sibling
    # links. May return self if no sibling is present.
    def last_sibling
      node = self
      while node.next_sibling
        node = node.next_sibling
      end
      return node
    end
    
    # Find the first sibling of self, by following previous_sibling
    # links. May return self if no sibling is present.
    def first_sibling
      node = self
      while node.previous_sibling
        node = node.previous_sibling
      end
      return node
    end
    
    # Finds the last sibling of self and links the node other
    # after it
    def append(other)
      self.last_sibling.add_sibling(other)
    end
    
    # Finds the first sibling of self and links the node other
    # in fromt of it
    def prepend(other)
      fs = self.first_sibling
      other.link(:next_sibling, fs)
      fs.link(:previous_sibling, other)
    end
    
    # Link the node as a child of self, setting up all
    # needed sibling links as well
    def add_child(new_child)
      linkto = nil
      if self.child
        linkto = self.child.last_sibling
        linkto.add_sibling(new_child)
      else
        link(:child, new_child)
      end
      new_child.link(:parent, self)
    end
    
    # Iterate over all child nodes
    def each_child
      return nil unless self.child
      node = self.child
      while node
        yield node
        node = node.next_sibling
      end
      return true
    end
    
    
    
  end
end