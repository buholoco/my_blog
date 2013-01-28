require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  def setup
    @attr = { :title => 'Title', :content => 'Valid Content'  }
  end
  
  
  test "should reject invalid title" do
    invalid_titles = ['', '  ', '            ', 'aaaa', '    a    ', 'a' * 51]
    invalid_titles.each do |title|
      assert !Blog.new(@attr.merge({:title => title})).valid?, "should reject invalid title"
    end
  end

  test "should accept valid title" do
    valid_titles = ['valid', 'e e e', 'validtitle', 
                    'un titulo mas o menos largo' ,'un titulo todavia mucho mas largo']
    valid_titles.each do |title|
      assert Blog.new(@attr.merge({:title => title})).valid?, "should accept valid title"
    end
  end

  test "should reject invalid content" do
    invalid_contents = ['', '                   ', '             aaa                ', 'a' * 9 ]
    invalid_contents.each do |content|
      assert !Blog.new(@attr.merge({:content => content})).valid?, "should reject valid content"
    end
  end

  test "should accept valid content" do
    valid_contents = ['Valid content', "Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim 
                      ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip 
                      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate 
                      velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat 
                      cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."]
                      
    valid_contents.each do |content|
      assert Blog.new(@attr.merge({:content => content})).valid?, "should accept valid content"
    end
  end
end
