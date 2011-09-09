describe GildedRose do

  let(:gr) { GildedRose.new }
  let(:sell_in) { 10 }
  let(:quality) { 10 }
  subject { DepreciatingItem.new("Name", sell_in, quality) }

  before { gr.instance_variable_set(:@items, [subject]) }

  describe '#update_quality' do

    context 'when an item has not expired' do

      before { gr.update_quality }

      its(:sell_in) { should == sell_in - 1 }
      its(:quality) { should == quality - 1 }

    end

    context 'when an item has expired' do

      let(:sell_in) { 0 }

      it 'reduces the item quality twice as quickly' do
        expect{ gr.update_quality }.to change { subject.quality }.by(-2)
      end

    end

    context 'when an item quality has dropped to 0' do

      let(:quality) { 0 }

      it 'does not affect the item quality' do
        expect{ gr.update_quality }.not_to change { subject.quality }
      end
    end

    shared_examples_for :appreciating_item do

      it "increases the item's quality" do
        expect{ gr.update_quality }.to change { subject.quality }.by(1)
      end

      context 'when the quality of the item has reached its maximum' do
        let(:quality) { 50 }
        it "does not increase the item's quality" do
          expect{ gr.update_quality }.not_to change { subject.quality }
        end
      end

    end

    describe 'an appreciating item' do
      subject { AppreciatingItem.new("Aged Brie", sell_in, quality) }
      it_should_behave_like :appreciating_item
    end

    context 'for an event-related appreciating item' do
      let(:sell_in) { 50 }
      subject { EventRelatedItem.new("Backstage passes to a TAFKAL80ETC concert", sell_in, quality) }
      it_should_behave_like :appreciating_item

      context 'when nearing the event date' do
        let(:sell_in) { 10 }
        it 'increases in value twice as quickly' do
          expect { gr.update_quality }.to change { subject.quality }.by(2)
        end
      end

      context 'when the event date DRAWS NIGH' do
        let(:sell_in) { 5 }
        it 'increases in value thrice as quickly' do
          expect { gr.update_quality }.to change { subject.quality }.by(3)
        end
      end

      context 'when the event is done and over' do
        let(:sell_in) { 0 }
        before { gr.update_quality }
        its(:quality) { should == 0 }
      end
    end

    context "for a legendary item" do

      subject { LegendaryItem.new("Sulfuras, Hand of Ragnaros", sell_in, quality) }

      before { gr.update_quality }

      its(:quality) { should == quality }
      its(:sell_in) { should == sell_in }

    end

    context "for a conjured item" do

      subject { ConjuredItem.new("Conjured Mana Cake", sell_in, quality) }

      it "degrades in quality twice as fast" do
        expect { gr.update_quality }.to change { subject.quality }.by(-2)
      end

    end

  end

end
