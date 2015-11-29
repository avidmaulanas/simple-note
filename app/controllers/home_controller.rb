class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:index]

  def cover
  end

  def index
  end

  def features
  end
end
