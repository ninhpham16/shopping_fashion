# frozen_string_literal: true

module Manager
  class BaseController < ApplicationController
    layout "admin"

    before_action :authenticate_admin!
    skip_before_action :store_user_location!

    def check_contributor
      unless current_admin.contributor?
        flash[:error] = "Only contributor!"
        redirect_to manager_blogs_path
      end
    end

    def check_admin
      unless current_admin.admin?
        flash[:error] = "Only admin!"
        redirect_to request.referer
      end
    end
  end
end
