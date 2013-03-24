# coding: utf-8
require 'minitest/autorun'

require File.expand_path('../passage', File.dirname(__FILE__))


class PassageTest < MiniTest::Unit::TestCase
  def test_reads_single_verse
    book = Book.new("1J", "1", "1", "1")
    passage = Passage.new(book)
    assert_equal 1, passage.verses.length
    assert_match /\ACo/, passage.verses.first
  end

  def test_reads_multiple_verses
    book = Book.new("1J", "1", "1", "7")
    passage = Passage.new(book)
    assert_equal 7, passage.verses.length
    assert_match /\AJeśli/, passage.verses.last
  end
end
