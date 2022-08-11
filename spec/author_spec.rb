require 'author'

describe Author do
  context 'To correctly instantiate an author object' do
    let(:author) { Author.new('James', 'Joyce') }

    it 'can add and access the publish first name property' do
      expect(author.first_name).to eq('James')
    end

    it 'can add and access the publish last name property' do
      expect(author.last_name).to eq('Joyce')
    end

    it "can have access to the author's object items storage" do
      expect(author.items.length).to eq(0)
    end

    it 'add_items to authors @items instance var' do
      allow(author).to receive(:add_item).and_return(author.items.push('an item'))
      expect(author.items.length).to eq(1)
    end
  end
end
