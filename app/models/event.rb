class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: :creator_id
    has_many :event_lists, foreign_key: :attended_event_id, inverse_of: 'attended_event'
    has_many :attendees, through: :event_lists
    validates :date, presence: true
end
