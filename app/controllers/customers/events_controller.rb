class Customers::EventsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @events = Event.all.page(params[:page]).per(3)
  end

  def show
    @event = Event.find(params[:id])
  end
end
