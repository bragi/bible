require 'open-uri'
require 'nokogiri'

class Passage
  attr_reader :first
  
  def initialize(book: "Gen", chapter: 1, first: "1", last: nil)
    @book = book
    @chapter = chapter
    @first = first.to_i
    @last = last && last.to_i
  end
  
  def url
    "http://www.biblia.info.pl/cgi-bin/biblia-nawigator.cgi?tlumaczenie=bw&rozdzial=#{@chapter}&st=i&ks=#{@book}&nw=tak"
  end
  
  def utf_encoded
    content.force_encoding(Encoding::ISO_8859_2).encode(Encoding::UTF_8)
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
    first = @first -1
    last = @last || v.length
    v[first..last]
  end
end