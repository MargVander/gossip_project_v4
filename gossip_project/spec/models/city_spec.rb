require 'rails_helper'

RSpec.describe City, type: :model do

  before(:each) do
    @city = City.create(name: "Bierne", zip_code: "59380")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@city).to be_a(City)
      expect(@city).to be_valid
    end

    describe "#name" do
      it "should not be valid without name" do
        bad_city = City.create(zip_code: "59380")
        expect(bad_city).not_to be_valid
        expect(bad_city.errors.include?(:name)).to eq(true)
      end
    end

  end

  context "associations" do

    describe "users" do
      it "should have_many users" do
        user = User.create(city: @city, first_name: "John", last_name: "Doe", description: "Blablabla", email: "missmarg@hotmail.com", age: 21)
        expect(@city.users.include?(user)).to eq(true)
      end
    end

  end
end
