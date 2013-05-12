# encoding: utf-8
require 'minitest/autorun'

require File.expand_path('../passage', File.dirname(__FILE__))


class PassageTest < MiniTest::Unit::TestCase
  def test_reads_single_verse
    book = Book.new("1J", "1", "1")
    passage = Passage.new(book)
    assert_equal 1, passage.verses.length
    assert_match /\ACo/, passage.verses.first[0]
  end

  def test_reads_multiple_verses
    book = Book.new("1J", "1", "1-7")
    passage = Passage.new(book)
    assert_equal 7, passage.verses.length
    assert_match /\AJeśli/, passage.verses.last[0]
  end

  def test_reads_verses_separated_by_comma
    book = Book.new("1J", "1", "2,6")
    passage = Passage.new(book)
    assert_equal 2, passage.verses.length
    assert_match /prawdy.\n/, passage.verses.last[0]
  end

  def test_reads_verses_separated_by_comma_and_dash
    book = Book.new("1J", "1", "4-6,8,10")
    passage = Passage.new(book)
    assert_equal 5, passage.verses.length
    assert_match /\AA to/, passage.verses.first[0]
  end
end
