class OrdersController < ApplicationController
  def index
    # binding.pry
    @product = Product.find(params[:format])
  end

  def create
  end
end
