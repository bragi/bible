require 'open-uri'
require 'nokogiri'

class Passage
  attr_reader :book
  
  def initialize(book)
    @book = book
  end
  
  def url
    "http://www.biblia.info.pl/cgi-bin/biblia-nawigator.cgi?tlumaczenie=bw&rozdzial=#{@book.chapter}&st=i&ks=#{@book.short_name}&nw=tak"
  end
  
  def content
    open(url).read
  end
  
  def doc
    Nokogiri::HTML(content)
  end
  
  def verses
    v = doc.css("span.werset").xpath("text()").map do |verse| 
      verse.to_s.encode(Encoding::UTF_8).strip
    end.reject do |verse| 
      verse == ""
    end
    first = book.first - 1
    last = book.last || v.length
    v[first..last]
  end
end