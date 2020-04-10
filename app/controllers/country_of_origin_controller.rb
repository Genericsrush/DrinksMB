class CountryOfOriginController < ApplicationController
  def show
    @country = CountryOfOrigin.find(params[:id])
  end
end
