class ApplicationController < ActionController::Base
  before_action :initialize_session
  def add_to_cart
    session[:cart] << params[:id]
    redirect_to root_path
  end
  def initialize_session
    session[:cart] ||= []
  end
end
