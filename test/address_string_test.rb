require 'minitest/autorun'

require File.expand_path('../address_string', File.dirname(__FILE__))

class AddressStringTest < MiniTest::Unit::TestCase
  def test_whole_book
    assert_equal ["Gen", "1", "1", nil], AddressString.new("Gen").to_params
  end

  def test_whole_chapter
    assert_equal ["Gen", "2", "1", nil], AddressString.new("Gen2").to_params
  end
  
  def test_whole_chapter_with_numeric_name
    assert_equal ["1Mch", "2", "1", nil], AddressString.new("1Mch2").to_params
  end

  def test_with_start_and_no_end
    assert_equal ["Gen", "2", "3", nil], AddressString.new("Gen2:3-").to_params
  end
  
  def test_with_start_and_end
    assert_equal ["Gen", "2", "3", "7"], AddressString.new("Gen2:3-7").to_params
  end

  def test_whole_chapter_with_space
    assert_equal ["Gen", "2", "1", nil], AddressString.new("Gen 2").to_params
  end
  
  def test_whole_chapter_with_numeric_name_with_space
    assert_equal ["1Mch", "2", "1", nil], AddressString.new("1Mch 2").to_params
  end

  def test_with_start_and_no_end_with_space
    assert_equal ["Gen", "2", "3", nil], AddressString.new("Gen 2:3-").to_params
  end
  
  def test_with_start_and_end_with_space
    assert_equal ["Gen", "2", "3", "7"], AddressString.new("Gen 2:3-7").to_params
  end
end