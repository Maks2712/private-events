class EventsController < ApplicationController
  #before_action :event_params
 before_action :set_user
 before_action :set_event, only: %i[update destroy edit]
 before_action :already_joined?, only: %i[show]

  def new
    @event=Event.new
  end

  def index
    @events= @user.created_events.all
    @all_events=Event.all
  end

  def show
    @is_joined=false
    @event=Event.find(params[:id])
    @attendees=@event.attendees.all
    @name=User.find(@event.creator_id).name
    if(@event.attendees.include?(User.find(current_user.id)))
      @is_joined=true
    end
  end

  def create
    #debugger
    @event=@user.created_events.build(event_params)
    if @event.save
			flash[:notice]='Event created!'
			redirect_to user_events_path(@user)	
		else
			flash[:alert]='Event isnt created!'
			redirect_to user_events_path()	
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
  def join_event
   @event=Event.find(params[:id])
   @user=current_user
   #@event.attendees.build(attended_event_id: @event.id)
   @event.attendees<<User.find(@user.id)
    flash[:notice] = "Successfully joined."
		redirect_to user_events_path(current_user)
  end
  def leave_event
    @event=Event.find(params[:id])
    @user=current_user
    #@event.attendees.build(attended_event_id: @event.id)
    @event.attendees.delete(User.find(@user.id))
    flash[:notice] = "Successfully left."
		redirect_to user_events_path(current_user)
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
     params.require(:event).permit(:id, :title, :date, :creator_id, :attendee_ids => [])
      # params.require(:event).permit(:data)
    end
    def already_joined?
      @is_joined=false
      @event=Event.find(params[:id])
      if(@event.attendees.include?(User.find(current_user.id)))
        is_joined=true
      end
      @is_joined
    end
end
