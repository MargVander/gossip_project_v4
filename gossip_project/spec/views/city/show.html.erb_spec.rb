require 'rails_helper'

RSpec.describe CityController, type: :controller do

  describe "GET show" do
    it "assigns @cities" do
      city = City.create

      get :show, id: city.id

      expect(assigns(:city)).to eq(city)
    end
  end

end
