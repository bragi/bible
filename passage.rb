# encoding: utf-8
class Passage
  attr_reader :book
  
  def initialize(book)
    @book = book
  end

  def file
    File.expand_path("data/#{@book.short_name}#{@book.chapter}.txt", File.dirname(__FILE__))
  end
  
  def has_verses?
    !verses.empty?
  end
  
  def verses
    return @verses if @verses
    verses = File.readlines(file)
    verses_selected = verses_range(book.verses, verses.length)
    @verses = verses.values_at(*verses_selected).zip(verses_selected)
  end

  private

  def verses_range(verses, verses_length)
    parsed_verses = []

    verses.split(',').each do |verse|
      next if verse[0] == '0'
      parsed_verses << parse_verse(verse, verses_length)
    end

    parsed_verses.flatten.compact.uniq.sort
  end

  def parse_verse(verse, verses_length)
    case verse
    when /\A(\d+)-(\d+)\z/
      ($1.to_i-1..($2.to_i > verses_length ?
                   verses_length-1 :$2.to_i-1)
      ).to_a
    when /\A(\d+)-\z/
      ($1.to_i-1..verses_length-1).to_a
    when /\A(\d+)\z/
      $1.to_i-1 if ($1.to_i <= verses_length)
    end
  end
end
