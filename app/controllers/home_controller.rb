class HomeController < ApplicationController
  def index
    @positions = Position.where(status: 1).page(params[:page]).per(10)
  end
end
