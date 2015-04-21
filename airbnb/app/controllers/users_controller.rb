class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def edit
  end

  private

  def user_params
    params.require(:user.permit(:first_name, :last_name, :picture)
  end

end
