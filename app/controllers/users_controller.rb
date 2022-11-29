class UsersController < ApplicationController
  before_action :set_creator, only: [:index, :show]
  def index
    @users=User.all
  end

  def show
    @user=current_user
    @events=Event.where(creator_id: current_user.id)
  end

  private

  def set_creator
    @user= current_user
  end

  def user_params 
    params.require(:user).permit(:name)
  end

end
