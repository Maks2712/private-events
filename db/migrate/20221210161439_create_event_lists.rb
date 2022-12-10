class CreateEventLists < ActiveRecord::Migration[7.0]
  def change
    create_table :event_lists do |t|

      t.timestamps
    end
  end
end
