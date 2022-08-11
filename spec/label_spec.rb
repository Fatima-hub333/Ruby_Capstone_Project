require 'label'

describe Label do
  context 'To correctly instantiate a label object' do
    let(:label) { Label.new('Gift', 'Red') }

    it 'can add, access and lowercase the title property' do
      expect(label.title).to eq('gift')
    end

    it 'can add, access and lowercase the color property' do
      expect(label.color).to eq('red')
    end

    it 'can have access to the items storage' do
      expect(label.items.length).to eq(0)
    end

    it "add_items to label's @items instance var" do
      allow(label).to receive(:add_item).and_return(label.items.push('an item'))
      expect(label.items.length).to eq(1)
    end
  end
end
