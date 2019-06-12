# frozen_string_literal: true

module Manager
  class ProductsController < Manager::BaseController

    def index
      @products = Product.page(params[:page]).order(created_at: :desc)
    end

    def show
      @product_images = @product.product_images.all
    end

    def new
      @product = Product.new
      @image = @product.images.build
    end

    def create
      product_data = product_params.merge(admin_id: current_admin.id)
      @product = Product.new product_data
      if @product.save
        params[:product][:images].each do |image|
          @product.images.create file: image
        end
        redirect_to manager_products_path, notice: "Product was successfully created."
      else
        render :new
      end
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity,
                                      images_attributes: %i[file product_id])
    end
  end
end
