class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html,:json,:xml

  # GET /events
  def index
    @events = Event.all
    respond_with @events
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
    respond_with @event
  end

  # GET /events/new
  def new
    @event = Event.new
    respond_with @event
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    respond_with @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      # respond_with @event
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      # respond_with @event
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:title, :description, :institution, :public, :start_date, :end_date)
    end
end
