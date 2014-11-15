class HomeController < ApplicationController
  layout 'application'

  def index
  end

  def home
    render layout: false
  end

  def contact
    render layout: false
  end

  def about
    render layout: false
  end

end
