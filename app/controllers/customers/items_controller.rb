class Customers::ItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @items = Item.all.page(params[:page]).per(3)
  end

  def show
    @item = Item.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @item.post_comments
  end

end
