# frozen_string_literal: true

module Manager
  class ProductsController < Manager::BaseController
    def index
      @products = Product.page(params[:page])
    end
  end
end
