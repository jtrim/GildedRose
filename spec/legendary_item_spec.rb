require 'spec_helper'

describe LegendaryItem do

  describe "#age" do

    let(:sell_in) { 10 }
    let(:quality) { 10 }
    subject       { LegendaryItem.new("Item", sell_in, quality) }

    it 'IS DOING ZEE NOTINK!j!@!@@eleven' do
      expect{ subject.age }.not_to change { subject.quality }
      expect{ subject.age }.not_to change { subject.sell_in }
    end

  end

end
