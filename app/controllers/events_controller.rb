class EventsController < ApplicationController
  before_action :set_categories, only: [:index, :show]

  def index
    set_pagination Event.all
  end

  def show
    set_pagination EventCategory.find(params[:id]).events
  end

  private
    def set_categories
      @categories = EventCategory.all
    end

    def set_pagination events
      @events = events.page(params[:page]).per(5)
    end
end
