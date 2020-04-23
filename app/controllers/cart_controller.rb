class CartController < ApplicationController
  def index
    @cart = session[:cart]
  end
end
