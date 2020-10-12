class Admins::PostCommentsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @post_comments = PostComment.all.page(params[:page]).per(3)
  end

end
