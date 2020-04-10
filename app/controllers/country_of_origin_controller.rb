class CountryOfOriginController < ApplicationController
  def show
    @country = CountryOfOrigin.find_by(params[:id])
  end
end
