class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @positions = Position.where(status: 1).page(params[:page]).per(10)
  end
end
