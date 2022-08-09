require_relative './app'

def main
  app = App.new
  app.greeter
  input = nil
  while input != '8'
    app.instructions
    input = gets.chomp
    # options(input, app)
  end
  puts
  puts 'Thanks for using Quckify!!'
end

# def options(input, app)
#   case input
#   when '1'
#     app.list_books
#   when '2'
#     app.list_music_albums
#   when '3'
#     app.list_labels
#   when '4'
#     app.list_authors
#   when '5'
#     app.list_sources
#   when '6'
#     app.add_book
#   when '7'
#     app.add_music_album
#   end
# end

main
