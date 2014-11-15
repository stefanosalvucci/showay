class HomeController < ApplicationController
  layout 'application'

  def index
  end

  def search
    render layout: false
  end

  def offer
    render layout: false
  end
end
