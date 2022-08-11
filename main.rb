require_relative './lib/app'

def main
  app = App.new
  app.greeter
  input = nil
  while input != '5'
    app.instructions
    input = gets.chomp
    options(input, app)
  end
  puts
  puts 'Thanks for using Stockify CLI!!'
end

def options(input, app)
  case input
  when '1'
    app.list_all_books
  when '2'
    app.list_all_labels
  when '3'
    app.list_all_authors
  when '4'
    app.add_book
  end
end

main
