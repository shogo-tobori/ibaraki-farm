class Admins::HomesController < ApplicationController

  before_action :authenticate_admin!, except:[:about]

  def top
    @items = Item.all
    @customers = Customer.all
    @events = Event.all
    @genres = Genre.all
    @post_comments = PostComment.all
    @likes = Like.all
  end

  def about
  end

end
