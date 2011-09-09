require 'spec_helper'

describe ConjuredItem do

  describe "#age" do

    subject       { ConjuredItem.new("Item", sell_in, quality) }
    let(:sell_in) { 10 }
    let(:quality) { 10 }
    before        { subject.age }

    its(:quality) { should == quality - 2 }
    its(:sell_in) { should == sell_in - 1 }

  end

end
