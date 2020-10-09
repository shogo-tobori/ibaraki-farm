class Customers::EventsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @events = Event.page(params[:page]).reverse_order
  end

  def show
    @event = Event.find(params[:id])
  end
end
