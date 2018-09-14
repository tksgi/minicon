class Admin::EventsController < ApplicationController
  layout 'admin'
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_choices, only: [:edit, :new]
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "event was successfully created."
      redirect_to admin_event_path(@event)
      # redirect_to admin_event_path(@event), notice: "event was successfully created."
    else
      flash.now['alert'] = 'Event could not be created'
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @event.update(event_params)
      redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
    else
      flash.now['alert'] = 'Event could not be updated'
      render :edit
    end
  end
  
  def destroy
    @event.destroy
    redirect_to admin_events_path, notice: 'Event was successfully destroyed.'
  end
  
  private
    def set_event
      @event = Event.find(params[:id])
    end

    def set_choices
      @choices = EventCategory.pluck("name", "id")
    end
    
    def event_params
      params.require(:event).permit(:event_category_id, :title, :location, :start_at,
                                    :ticket_price, :ticket_quantity, :image)
    end
end
