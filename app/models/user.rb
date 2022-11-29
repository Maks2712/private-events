class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :created_events, class_name: "Event", foreign_key: :creator_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
