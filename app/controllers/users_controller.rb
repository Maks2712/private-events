class UsersController < ApplicationController
  before_action :set_creator, only: [:index, :show]
 # before_action :user_params
  def index
    @users=User.all
  end

  def show
    @user=current_user
    @events=Event.where(creator_id: @user.id)

    @attended_events=@user.attended_events
  end

  private

  def set_creator
    @user= current_user
  end

  def user_params 
    params.require(:user).permit(:name, :id,:attended_event_ids => [])
  end
 
end
