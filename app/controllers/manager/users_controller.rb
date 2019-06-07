# frozen_string_literal: true

class Manager::UsersController < Manager::BaseController
  # before_action :logged_in_user, only: [:index, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
