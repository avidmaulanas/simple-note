class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:index]

  def cover
  end

  def index
  	@notes = Note.all.page(params[:page]).per(9)

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def features
  end
end
