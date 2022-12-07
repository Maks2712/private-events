class EventsController < ApplicationController
  #before_action :event_params
 before_action :set_user
 before_action :set_event, only: %i[update show destroy edit]

  def new
    @event=Event.new
  end

  def index
    @events=@user.created_events.all
  end

  def show
    
  end

  def create
    #debugger
    @event=@user.created_events.build(event_params)
    if @event.save
			flash[:notice]='Event created!'
			redirect_to user_events_path(@user)	
		else
			flash[:alert]='Event isnt created!'
			redirect_to user_events_path	
		end
  end
  def edit
    
  end

  def update
    @event.update(event_params)
    redirect_to user_event_path(@event)
  end
  def destroy
		@event.destroy
		flash[:notice] = "Event successfully deleted."
		redirect_to user_events_path
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @user = current_user
      @event = @user.created_events.find(params[:id])
    end
    def set_user
      @user = current_user
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
     params.require(:event).permit(:id, :title, :date, :creator_id)
    
   # params.require(:event).permit(:data)
    end
end
