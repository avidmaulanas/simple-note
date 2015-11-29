class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [:cover]

  def cover
  end

  def index
  end

  def new
  end

  def edit
  end
end
