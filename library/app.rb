require_relative 'book'
require_relative 'label'
require_relative 'author'
require_relative 'storage'

class App
  def initialize
    @storage = Storage.new
  end

  def greeter
    print "Hello! Welcome to Stockify!\n\n"
  end

  def instructions
    puts "Please choose an option by entering a number:
    1 - List all books
    2 - List all labels (e.g. 'Gift', 'New')
    3 - List all authors
    4 - Add a book
    5 - Exit"
    puts
  end

  def list_all_books
    if @books.count.zero?
      puts "There are not registered books. Please add one!\n\n"
    end
    @books.each do |item|
      puts "[#{item.class}] Publisher: #{item.publisher} Published date: #{item.publish_date} Cover_state: #{item.cover_state} Label: #{item.label.title}\n\n"
    end
  end

  def list_all_labels
    if @labels.count.zero?
      puts "There are not registered labels. Please add one!\n\n"
    end
    @labels.each do |item|
      puts "[#{item.class}] Name: #{item.title} Color: #{item.color}\n\n"
    end
  end

  def list_all_authors
    if @authors.count.zero?
      puts "There are not registered authors. Please add one!\n\n"
    end
    @authors.each do |item|
      puts "[#{item.class}] Name: #{item.first_name} #{item.last_name}\n\n"
    end
  end

  def add_book
    @storage.add_book
  end
end
