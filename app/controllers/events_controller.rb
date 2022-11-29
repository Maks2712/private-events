class EventsController < ApplicationController
  def index
    @events=Event.all
  end
  def show
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :creator_id)
    end
end
