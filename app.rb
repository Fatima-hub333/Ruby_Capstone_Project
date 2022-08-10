require_relative './library/book'
require_relative './library/label'

class App
  def initialize
    @books = []
    @labels = []
  end

  def greeter
    print "Hello! Welcome to Quckify!\n\n"
  end

  def instructions
    puts "Please choose an option by entering a number:
    1 - List all books
    2 - List all labels (e.g. 'Gift', 'New')
    3 - Add a book
    4 - Exit"
    puts
  end

  def list_all_books
    if @books.count.zero?
      puts "There are not books registered. Please add one!\n\n"
    end
    @books.each do |item|
      puts "[#{item.class}] Publisher: #{item.publisher} Published date: #{item.publish_date} Cover_state: #{item.cover_state} Label: #{item.label.title}\n\n"
    end
  end

  def list_all_labels
    if @labels.count.zero?
      puts "There are not labels registered. Please add one!\n\n"
    end
    @labels.each do |item|
      puts "[#{item.class}] Name: #{item.title} Color: #{item.color}\n\n"
    end
  end

  def add_book
    print 'Enter publish date: '
    publish_date = gets.chomp
    print 'Enter publisher: '
    publisher = gets.chomp
    print 'Whats the cover state of the book? '
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    print 'Enter a label for your item eg. Gift, New: '
    label_title = gets.chomp
    print 'Enter a color for your label: '
    label_color = gets.chomp
    label = Label.new(label_title, label_color)
    @labels << label
    book.label=label
    @books << book
    puts
  end
end
