class Admins::PostCommentsController < ApplicationController

  def index
    @post_comments = PostComment.all.page(params[:page]).per(3)
  end

end
