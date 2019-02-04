require 'rails_helper'

RSpec.describe Tag, type: :model do

  before(:each) do
    @tag = Tag.create(title: "Blabla")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@tag).to be_a(Tag)
      expect(@tag).to be_valid
    end

    describe "#title" do
      it "should not be valid without title" do
        bad_tag = Tag.create
        expect(bad_tag).not_to be_valid
        expect(bad_tag.errors.include?(:title)).to eq(true)
      end
    end



  end

end
