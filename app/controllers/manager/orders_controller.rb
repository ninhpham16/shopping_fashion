# frozen_string_literal: true

module Manager
  class OrdersController < Manager::BaseController
    def index
      @orders = Order.page(params[:page])
    end

    def show
      @order = Order.find(params[:id])
    end

    def destroy
      @order = Order.find(params[:id])
      @order.destroy
      flash[:success] = "Order Deleted"
      redirect_to manager_orders_path
    end
  end
end
