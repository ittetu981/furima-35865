class ItemsController < ApplicationController

  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end



  private

  def item_params
    params.require(:item).permit(:product_name, :description_of_item, :category_id, :delivery_charge_id, :product_status_id, :shipment_source_id, :price, :shipping_time_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    unless @item.user == current_user
      redirect_to root_path
    end
  end
end
