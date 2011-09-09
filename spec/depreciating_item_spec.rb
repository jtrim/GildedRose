require 'spec_helper'

describe DepreciatingItem do

  describe "#age" do

    subject       { DepreciatingItem.new("Item", sell_in, quality) }
    let(:sell_in) { 10 }
    let(:quality) { 10 }
    before        { subject.age }

    its(:quality) { should == quality - 1 }
    its(:sell_in) { should == sell_in - 1 }

    context 'when expired' do
      let(:sell_in) { 0 }
      its(:quality) { should == quality - 2 }
    end

    context 'when worthless' do
      let(:quality) { 0 }
      its(:quality) { should == 0 }
    end

  end

end
