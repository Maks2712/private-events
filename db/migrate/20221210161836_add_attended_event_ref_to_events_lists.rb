class AddAttendedEventRefToEventsLists < ActiveRecord::Migration[7.0]
  def change
    add_reference :event_lists, :attended_event, foreign_key: {to_table: :events}
  end
end
