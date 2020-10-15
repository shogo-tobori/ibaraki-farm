class Customers::LikesController < ApplicationController

  before_action :authenticate_customer!

  def create
    @like = Like.new(customer_id: current_customer.id, item_id: params[:item_id])
    @like.save
    flash[:notice] = "いいねありがとうございます！"
    redirect_to("/customers/items/#{params[:item_id]}")
  end

  def destroy
    @like = Like.find_by(customer_id: current_customer.id, item_id: params[:item_id])
    @like.destroy
    redirect_to("/customers/items/#{params[:item_id]}")
  end
end
