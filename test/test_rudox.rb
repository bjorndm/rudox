
require 'minitest/autorun'
require 'rudox'

describe Rudox do
  it "should be able tov write a blank docx file" do 
    doc = Rudox::Document.new('test/output')
  end
end







