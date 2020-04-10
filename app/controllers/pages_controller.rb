class PagesController < ApplicationController
  def permalink
    @page = Page.find_by(permalink: params[:permalink])
  end
  def index
    @pages = Page.all
  end

  def show

  end
end
