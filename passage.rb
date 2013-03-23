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
    first = book.first - 1
    last = book.last ? (book.last - 1) : verses.length
    @verses = verses[first..last] || []
  end
end
