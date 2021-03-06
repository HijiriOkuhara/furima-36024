class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_product

  def index
    @purchase_record_delivery_area = PurchaseRecordDeliveryArea.new
    redirect_to root_path if current_user.id == @product.user_id || !@product.purchase_record.nil?
  end

  def create
    @purchase_record_delivery_area = PurchaseRecordDeliveryArea.new(order_params)
    if @purchase_record_delivery_area.valid?
      pay_item
      @purchase_record_delivery_area.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_record_delivery_area).permit(:postal_code, :prefecture, :city, :block, :building_name, :phone_number).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Product.find(order_params[:product_id])[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
