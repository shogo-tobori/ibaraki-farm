class Customers::LikesController < ApplicationController

  def create
    @like = Like.new(customer_id: current_customer.id, item_id: params[:item_id])
    @like.save
    redirect_to("/customers/items/#{params[:item_id]}")
  end

  def destroy
    @like = Like.find_by(customer_id: current_customer.id, item_id: params[:item_id])
    @like.destroy
    redirect_to("/customers/items/#{params[:item_id]}")
  end
end
