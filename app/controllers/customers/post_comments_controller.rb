class Customers::PostCommentsController < ApplicationController

  before_action :authenticate_customer!

  def create
    @item = Item.find(params[:item_id])
      if @post_comment = @item.post_comments.new(post_comment_params)
        @post_comment.customer_id = current_customer.id
        @post_comment.save
        flash[:notice] = "コメントありがとうございます！"
        redirect_to request.referer
      else
        render template: 'items/show'
      end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to request.referer
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
