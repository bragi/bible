# coding: utf-8
class AddressString
  def initialize(text)
    @text = text
  end


  def to_params
  	case @text
  	when /\A(\d*[A-Za-z]+)\z/
  		return [$1, "1", "1", nil]
  	when /\A(\d*[A-Za-z]+)\s*(\d+)\z/
  		return [$1, $2, "1", nil]
  	when /\A(\d*[A-Za-z]+)\s*(\d+):(\d+)-?\z/
  		return [$1, $2, $3, nil]
  	when /\A(\d*[A-Za-z]+)\s*(\d+):(\d+)-(\d+)\z/
  		return [$1, $2, $3, $4]
    else
      raise "Text doesn't match anything known: '#{@text}'"
  	end
  end
  
end
