require_relative './app'

def main
  app = App.new
  app.greeter
  input = nil
  while input != '4'
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
    app.add_book
  end
end

main
