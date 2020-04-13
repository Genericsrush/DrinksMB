
class DrinkController < ApplicationController
  def index
    @drinks = Drink.all().page params[:page]
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def sale
    @drinks = Drink.where('discount != 0').page params[:page]
  end

  def new
    @drinks = Drink.where('created_at <= ?', DateTime.current.to_date).page params[:page]
  end
end
