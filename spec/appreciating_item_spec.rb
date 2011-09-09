require 'spec_helper'

describe AppreciatingItem do

  describe '#age' do

    subject       { AppreciatingItem.new("Item", sell_in, quality) }
    let(:sell_in) { 10 }
    let(:quality) { 10 }
    before        { subject.age }

    its(:quality) { should == quality + 1 }
    its(:sell_in) { should == sell_in - 1 }

    context 'when at maximum value' do
      let(:quality) { AppreciatingItem::MAXIMUM_QUALITY }
      its(:quality) { should == AppreciatingItem::MAXIMUM_QUALITY }
    end

  end

end
