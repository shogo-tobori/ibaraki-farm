class Customers::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @item.post_comments
  end

end
