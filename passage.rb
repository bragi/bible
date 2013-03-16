require 'open-uri'
require 'nokogiri'

class Passage
  def url(book, chapter)
    "http://www.biblia.info.pl/cgi-bin/biblia-nawigator.cgi?tlumaczenie=bw&rozdzial=#{chapter}&st=i&ks=#{book}&nw=tak"
  end

  def content(book: "Gen", chapter: 1, start_verse: 1, end_verse: nil)
    open(url(book, chapter))
  end
end