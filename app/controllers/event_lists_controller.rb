class EventListsController < ApplicationController
   
   private
   def eventlist_params
      params.require(:event_list).permit(:attended_event_id, :attendee_id)
   end
end
