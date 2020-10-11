class Customers::HomesController < ApplicationController
  def top
    @all_ranks = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
  end

  def about
  end
end
