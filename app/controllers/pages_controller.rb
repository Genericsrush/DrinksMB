class PagesController < ApplicationController
  def permalink

  end
  def index
    @pages = Page.all
  end

  def show

  end
end
