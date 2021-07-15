class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order.valid?
      pay_order
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:price, :postal_code, :shipment_source_id, :municipality, :address, :phone_number).merge(user_id: current_user.id)
  end

  def pay_order
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: japanese_yen
    )
  end
end
