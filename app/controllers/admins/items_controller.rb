class Admins::ItemsController < ApplicationController
	before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_items_path
  end

  def index
    @items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
  	@genres = Genre.all
  	if @item.update(item_params)
      flash[:notice] = "商品情報を更新しました"
  		redirect_to admins_items_path
  	else
  		render :edit
  	end
  end

 private

 def item_params
 	params.require(:item).permit(:name, :explanation, :shipping_time, :image)
 end
end
