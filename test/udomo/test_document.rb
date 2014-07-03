require 'minitest/autorun'
require 'udomo'


describe Udomo::Document do
  it "can be instantiated" do 
    doc = Udomo::Document.new
    doc.wont_be_nil
  end
end