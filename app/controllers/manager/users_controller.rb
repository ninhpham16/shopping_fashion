# frozen_string_literal: true

class Manager::UsersController < Manager::BaseController

  def index
    @users = User.page params[:page]
  end
end
