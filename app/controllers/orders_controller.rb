class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:format])
  end

  def create
  end
end
