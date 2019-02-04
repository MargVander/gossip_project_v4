require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create(city_id: 1, first_name: "John", last_name: "Doe", description: "Blablabla", email: "missmarg@hotmail.com", age: 21)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#first_name" do
      it "should not be valid without first_name" do
        bad_user = User.create(last_name: "Doe")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:first_name)).to eq(true)
      end
    end

    describe "#last_name" do
      it "should not be valid without last_name" do
        bad_user = User.create(first_name: "John")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:last_name)).to eq(true)
      end
    end


  end

  context "associations" do

    describe "gossips" do
      it "should have_many gossips" do
        gossip = Gossip.create(user: @user, title: "title", content: "content")
        expect(@user.gossips.include?(gossip)).to eq(true)
      end
    end

  end


end
