class Admins::LikesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @likes = Like.all.page(params[:page]).per(3)
  end

end
