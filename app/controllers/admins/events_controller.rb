class Admins::EventsController < ApplicationController

  before_action :authenticate_admin!

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "新たに商品が追加されました"
      redirect_to admins_events_path
    else
      render :new
    end
  end

  def index
    @events = Event.all.page(params[:page]).per(3)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "新たに商品が追加されました"
      redirect_to admins_events_path
    else
      render :edit
    end
  end

 private

   def event_params
    params.require(:event).permit(:title, :explanation, :start, :end)
   end

end
