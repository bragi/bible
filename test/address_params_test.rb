# encoding: utf-8
require 'minitest/autorun'

require File.expand_path('../address_params', File.dirname(__FILE__))

class AddressParamsTest < MiniTest::Unit::TestCase
  def test_no_book
    assert_equal "Gen", AddressParams.new({}).to_s
  end

  def test_whole_book
    assert_equal "Gen", AddressParams.new(book: "Gen").to_s
  end

  def test_whole_chapter
    assert_equal "Gen2", AddressParams.new(book: "Gen", chapter: "2").to_s
  end
  
  def test_with_start_and_no_end
    assert_equal "Gen2:3-", AddressParams.new(book: "Gen", chapter: "2", verses: "3-").to_s
  end
  
  def test_with_start_and_end
    assert_equal "Gen2:3-7", AddressParams.new(book: "Gen", chapter: "2", verses: "3-7").to_s
  end

  def test_single_verse
    assert_equal "Gen2:3", AddressParams.new(book: "Gen", chapter: "2", verses: "3").to_s
  end

  def test_without_chapter_ignore_verses
    assert_equal "Gen", AddressParams.new(book: "Gen", verses: "3").to_s
  end

  def test_verses_separated_by_comma
    assert_equal "Gen1:5,8,12", AddressParams.new(book: "Gen", chapter: "1", verses: "5,8,12").to_s
  end

  def test_verses_separated_by_dash_and_comma
    assert_equal "Gen1:5-8,15-18,22", AddressParams.new(book: "Gen", chapter: "1", verses: "5-8,15-18,22").to_s
  end

  def test_verses_with_optional_spaces
    assert_equal "Gen1:2,3,15-18,23", AddressParams.new(book: "Gen", chapter: "1", verses: "2,  3,15-18, 23 ").to_s
  end
end
