# coding: utf-8
class AddressParams
  attr_reader :params
  
  def initialize(params)
    @params = params
  end

  def to_s
    book = value_or_nil(params[:book]) || "Gen"
    chapter = value_or_nil(params[:chapter])
    first = value_or_nil(params[:first])
    last = value_or_nil(params[:last])

    return book unless chapter
    return "#{book}#{chapter}" unless first
    return "#{book}#{chapter}:#{first}-" unless last
    "#{book}#{chapter}:#{first}-#{last}"
  end

  private

  def value_or_nil(value)
    return value unless value
    return nil if value.strip == ""
    value
  end
end
