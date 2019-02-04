require 'rails_helper'

RSpec.describe PrivateMessage, type: :model do

  before(:each) do
    @pm = PrivateMessage.create(content: "Blablablablabla")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@pm).to be_a(PrivateMessage)
      expect(@pm).to be_valid
    end

    describe "#content" do
      it "should not be valid without content" do
        bad_pm = PrivateMessage.create
        expect(bad_pm).not_to be_valid
        expect(bad_pm.errors.include?(:content)).to eq(true)
      end
    end



  end

end
