
class DrinkController < ApplicationController
  def index
    @drinks = Drink.all().page params[:page]
  end

  def show
    @drink = Drink.find_by(params[:id])
  end
end
