class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:index]

  def cover
  end

  def index
  	@notes = Note.all.includes(:user).order(created_at: :desc).page(params[:page]).per(10)

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def features
  end
end
