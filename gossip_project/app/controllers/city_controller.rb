class CityController < ApplicationController
  def show
    @city = City.find(params[:city_id])
    @user = @city.users
  end
end
