
class DrinkController < ApplicationController
  def index
    @drinks = Drink.all().page params[:page]
  end

  def show
    @drink = Drink.find(params[:id])
  end
end
