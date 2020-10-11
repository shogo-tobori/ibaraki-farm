class Admins::LikesController < ApplicationController

  @likes = Like.all.page(params[:page]).per(3)

end
