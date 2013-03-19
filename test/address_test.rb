require 'minitest/autorun'

require File.expand_path('../address', File.dirname(__FILE__))

class AddressTest < MiniTest::Unit::TestCase
  def test_whole_book
    assert_equal ["Gen", "1", "1", nil], Address.new("Gen").to_params
  end

  def test_whole_chapter
    assert_equal ["Gen", "2", "1", nil], Address.new("Gen 2").to_params
  end
  
  def test_whole_chapter_with_numeric_name
    assert_equal ["1Mch", "2", "1", nil], Address.new("1Mch 2").to_params
  end

  def test_with_start_and_no_end
    assert_equal ["Gen", "2", "3", nil], Address.new("Gen 2:3-").to_params
  end
  
  def test_with_start_and_end
    assert_equal ["Gen", "2", "3", "7"], Address.new("Gen 2:3-7").to_params
  end
end