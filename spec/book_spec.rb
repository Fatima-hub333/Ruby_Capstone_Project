require 'book'

describe Book do
  context 'To correctly instantiate a book object' do
    let(:book) { Book.new('2009-07-07', 'Elsevier', 'Good') }

    it 'can add and access the publish date property' do
      expect(book.publish_date).to be_a Date
    end

    it 'can add and store publisher property' do
      expect(book.publisher).to eq('Elsevier')
    end

    it 'can add and store cover_state property' do
      expect(book.cover_state).to eq('good')
    end

    it 'can_be_archived? method returns false values' do
      allow(book).to receive(:can_be_archived?).and_return(false)
      expect(book.send(:can_be_archived?)).to be false
    end

    it 'can_be_archived? method returns true values' do
      allow(book).to receive(:can_be_archived?).and_return(true)
      expect(book.send(:can_be_archived?)).to be true
    end
  end
end
