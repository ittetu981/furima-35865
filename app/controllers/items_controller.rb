class ItemsController < ApplicationController

  before_action :authenticate_user!, except:[:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description_of_item, :category_id, :delivery_charge_id, :product_status_id, :shipment_source_id, :price, :shipping_time_id, :image).merge(user_id: current_user.id)
  end
end
