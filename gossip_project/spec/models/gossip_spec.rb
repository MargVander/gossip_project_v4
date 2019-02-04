require 'rails_helper'

RSpec.describe Gossip, type: :model do

  before(:each) do
    @gossip = Gossip.create(title: "Blabla", content: "Blablabla")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@gossip).to be_a(Gossip)
      expect(@gossip).to be_valid
    end

    describe "#title" do
      it "should not be valid without title" do
        bad_gossip = Gossip.create(content: "Blablabla")
        expect(bad_gossip).not_to be_valid
        expect(bad_gossip.errors.include?(:title)).to eq(true)
      end
    end

    describe "#content" do
      it "should not be valid without content" do
        bad_gossip = Gossip.create(title: "Blabla")
        expect(bad_gossip).not_to be_valid
        expect(bad_gossip.errors.include?(:content)).to eq(true)

      end
    end


  end

end
