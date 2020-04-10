
class DrinkController < ApplicationController
  def index
    @drinks = Drink.all()
  end

  def show
    @drnk = Drink.findby(params[:id])
  end
end
