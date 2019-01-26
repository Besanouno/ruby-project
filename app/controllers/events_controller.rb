class EventsController < ApplicationController
  before_action :check_logged_in, :only => [:new, :create]
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    set_event
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:komunikat] = 'Wydarzenie zostało poprawnie stworzone.'
      redirect_to "/events/#{@event.id}"
    else
      render 'new'
    end
  end
  
  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:artist, :price_low, :price_high, :event_date, :description)
    end
  
    def check_logged_in
      authenticate_or_request_with_http_basic("Ads") do |username, password|
        username == "admin" && password == "admin"
      end
  end
end
