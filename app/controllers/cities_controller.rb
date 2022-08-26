class CitiesController < ApplicationController
  def show
    @city = City.eager_load(:prefecture).find(params[:id])
    @stores = Store.includes(:reviews, city: :prefecture).where(city: @city)
    @satisfaction_averages = Review.where(store: @stores).group(:store).average(:satisfaction)
    @cities = City.where(prefecture: @city.prefecture)
  end
end
