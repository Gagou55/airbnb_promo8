class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index

  end

  def show
    current_user = User.find(params[:id])
    @flats = current_user.flats
  end

end