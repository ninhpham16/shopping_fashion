# frozen_string_literal: true

module Manager
  class OrdersController < Manager::BaseController
    def index
      @orders = Order.all.page(params[:page])
    end
  end
end
