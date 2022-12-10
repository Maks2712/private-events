class AddAttendeeRefToEventsLists < ActiveRecord::Migration[7.0]
  def change
    add_reference :event_lists, :attendee, foreign_key: {to_table: :users}
  end
end
