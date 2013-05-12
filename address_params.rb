# encoding: utf-8
class AddressParams
  attr_reader :params
  
  def initialize(params)
    @params = params
  end

  def to_s
    book = value_or_nil(params[:book]) || "Gen"
    chapter = value_or_nil(params[:chapter])
    verses = value_or_nil(params[:verses])

    return book unless chapter
    return "#{book}#{chapter}" unless verses
    return "#{book}#{chapter}:#{verses.gsub(' ', '')}"
  end

  private

  def value_or_nil(value)
    return value unless value
    return nil if value.strip == ""
    value
  end
end
