require 'minitest/autorun'
require 'udomo'

class Node
  include Udomo::Node
end

describe Udomo::Node do
  it "can link another node as a child" do 
    par = Node.new(:a1)
    ch1 = Node.new(:b1)
    ch2 = Node.new(:b2)
    ch3 = Node.new(:b3)
    par.add_child(ch1)
    par.add_child(ch2)
    par.add_child(ch3)
    
    par.child.must_equal ch1
    par.child.next_sibling.must_equal ch2
    par.child.next_sibling.next_sibling.must_equal ch3
    ch1.parent.must_equal par
    ch2.parent.must_equal par
    ch3.parent.must_equal par
  end
  
  it "can iterate over the children" do 
    par = Node.new(:a1)
    ch1 = Node.new(:b1)
    ch2 = Node.new(:b2)
    ch3 = Node.new(:b3)
    par.add_child(ch1)
    par.add_child(ch2)
    par.add_child(ch3)
    
    res = []
    par.each_child do | ch| 
      res << ch.id
    end
    res.must_equal [:b1, :b2, :b3]
  end
  
  it "can append another node as a sibling" do 
    aid = Node.new(:a1)
    ch1 = Node.new(:b1)
    ch2 = Node.new(:b2)
    ch3 = Node.new(:b3)
    aid.append(ch1)
    aid.append(ch2)
    aid.append(ch3)
    
    aid.last_sibling.must_equal ch3
  end
  
  it "can prepend another node as a sibling" do 
    aid = Node.new(:a1)
    ch1 = Node.new(:b1)
    ch2 = Node.new(:b2)
    ch3 = Node.new(:b3)
    aid.prepend(ch1)
    aid.prepend(ch2)
    aid.prepend(ch3)
    
    aid.first_sibling.must_equal ch3
  end

  
  
  
end