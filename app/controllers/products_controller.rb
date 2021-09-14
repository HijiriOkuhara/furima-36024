class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @products = Product.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def product_params
  params.require(:product).permit(:name, :description, :category_id, :state_id, :delivery_charge_burden_id, :prefecture_id,
                                  :delivery_day_id, :price, :image).merge(user_id: current_user.id)
end
