class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :created_events, class_name: "Event", foreign_key: :creator_id
  has_many :event_lists, foreign_key: :attendee_id
  has_many :attended_events, through: :event_lists, source: :attended_event
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
