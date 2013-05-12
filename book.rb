# encoding: utf-8
require 'yaml'

class Book
  
  def self.book_names
    return @@book_names if defined?(@@book_names)
    @@book_names = YAML::load(File.open(File.join(File.dirname(__FILE__), "data", "bible.yaml")))
  end

  def self.books
    return @@books if defined?(@@books)
    @books = book_names[:old].merge(book_names[:new])
  end
    
  def initialize(short_name, chapter, verses)
    @short_name = Book.books.include?(short_name) ? short_name : "Gen"
    @full_name = Book.books[@short_name][:full_name]
    @chapter = chapter.to_i > 0 ? chapter.to_i : 1
    @verses = verses
    @passage = Passage.new(self)
  end
  
  attr_reader :short_name, :full_name, :chapter, :verses, :passage
  
  def passage_name
    "#{full_name}, #{chapter}, #{verses}"
  end

  def options(group_name)
    Book.book_names[group_name].map { |short_name, data| Option.new(short_name, data[:full_name], short_name == @short_name) }
  end
  
  def group_options
    { "Stary Testament" => options(:old), "Nowy Testament" => options(:new) }
  end
  
  class Option
   def initialize(value, text, selected)
     @value = value
     @text = text
     @selected = selected
   end
   
   attr_reader :text
   
   def attributes
     @selected ? {value: @value, selected: "selected"} : {value: @value}
   end
  end
end
