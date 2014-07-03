require 'minitest/autorun'
require 'udomo'

class Node
  include Udomo::Node
end

describe Udomo::Network do
  it "can generate a unique id" do 
    id1 = Udomo::Network.generate_id
    id2 = Udomo::Network.generate_id
    id3 = Udomo::Network.generate_id
    
    id1.must_equal :id1
    id2.must_equal :id2
    id3.must_equal :id3
  end
end