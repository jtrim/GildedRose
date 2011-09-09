require 'spec_helper'

describe EventRelatedItem do

  describe "#age" do

    let(:sell_in) { 20 }
    let(:quality) { 10 }

    subject       { EventRelatedItem.new("Item", sell_in, quality) }

    context 'by default' do
      before { subject.age }

      its(:sell_in) { should == sell_in - 1 }
      its(:quality) { should == quality + 1 }

      context "when within 10 days of the event" do
        let(:sell_in) { 10 }
        its(:quality) { should == quality + 2 }
      end

      context 'when within 5 days of the event' do
        let(:sell_in) { 5 }
        its(:quality) { should == quality + 3 }
      end
    end

    context 'when quality is at maximum' do
      let(:quality) { EventRelatedItem::MAXIMUM_QUALITY }
      it 'does not change its quality' do
        expect{ subject.age }.to_not change { subject.quality }
      end
    end

    context 'when the event is complete' do

      let(:sell_in) { 0 }
      before { subject.age }

      its(:quality) { should == 0 }

    end

    context 'when nearing maximum quality' do
      let(:sell_in) { 4 }
      let(:quality) { 49 }
      before { subject.age }
      it 'never increases above a quality of 50' do
        subject.quality.should == EventRelatedItem::MAXIMUM_QUALITY
      end
    end
  end

end

