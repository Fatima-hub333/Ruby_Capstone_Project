require_relative './library/book'
require_relative './library/label'

label = Label.new('Gift', 'Red')

book = Book.new('2020-08-07', 'Elsevier', 'good')

book.label = label

p book.move_to_archive

p book.can_be_archived?

# puts

# label.add_item(book)

# p label

# puts

# p book
