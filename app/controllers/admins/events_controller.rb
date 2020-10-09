class Admins::EventsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to admins_events_path
  end

  def index
    @events = Event.page(params[:page]).reverse_order
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to admins_events_path
  end

 private

   def event_params
    params.require(:event).permit(:title, :explanation, :start, :end)
   end

end
