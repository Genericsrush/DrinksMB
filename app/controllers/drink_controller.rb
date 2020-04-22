
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

  def search
    if params[:country].blank?
      @drinks = Drink.where( 'name LIKE ?', "%"+params[:name]+"%").page params[:page]
    else
      @drinks = Drink.where( 'name LIKE ?', "%"+params[:name]+"%").where("country_of_origin_id = ?",params[:country]).page params[:page]
    end
  end

  def country
    @drinks = Drink.where('country_of_origin = ?',params[:country_of_origin]).page params[:page]
  end
end
