class Api::ItemsController < ApplicationControlle
  before_action :set_items, only: [:show, :update, :destroy]

  def index
    render json: Item.all
  end

  def show
    render json: @Item
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: item
    else
      render json: item.erros, status: 422
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @product.errors, status: 422
    end
  end

  def destroy
    @item.destroy
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name)
    end
end
