require 'fileutils'
require File.expand_path('../book', File.dirname(__FILE__))
require File.expand_path('../passage', File.dirname(__FILE__))

class Fetch
  def target_dir
    File.expand_path("../data", File.dirname(__FILE__))
  end

  def book_names
    Book::BOOK_NAMES.keys
  end

  def target_file(name, chapter)
    file = File.join(target_dir, "#{name}#{chapter}.txt")
    puts "Opening #{file.to_s}"
    file
  end

  def books_file
    File.join(target_dir, "books.txt")
  end

  def write_book_chapters(book, chapter)
    File.open(books_file, "a") do |file|
      file << "#{book}: #{chapter-1}\n"
    end
  end

  def fetch
    book_names.each do |name|
      chapter = 1
      book = Book.new(name, chapter, 1, nil)
      puts "Checking book #{book.passage_name}"
      while(book.passage.has_verses?) do
        File.open(target_file(name, chapter), "w") do |file|
          file << book.passage.verses.join("\n")
        end
        chapter += 1
        book = Book.new(name, chapter, 1, nil)
      end
      write_book_chapters(name, chapter)
    end
  end
end

Fetch.new.fetch
