class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart

  def add_to_cart
    id = params[:id].to_i
    product = { "id" => id, "qty" => 1}

    session[:cart].each{|v| v["qty"] += 1 if v["id"] == id }

    session[:cart] << product unless session[:cart].any? { |h| h["id"] == id }
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete_if { |h| h["id"] == id }
    redirect_back(fallback_location: root_path)
  end

  def initialize_session
    session[:cart] ||= []
  end

  def load_cart
    @cart = session[:cart]
  end

  def increment
    id = params[:id].to_i
    session[:cart].each{|v| v["qty"] += 1 if v["id"] == id }
    redirect_back(fallback_location: root_path)
  end

  def decrement
    id = params[:id].to_i
    session[:cart].each do |v|
    if v["id"] == id
      if v["qty"] == 1
        session[:cart].delete_if { |h| h["id"] == id }
      else
        v["qty"] -= 1
      end
    end
  end
  redirect_back(fallback_location: root_path)
  end

end
