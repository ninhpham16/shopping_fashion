# frozen_string_literal: true

module Manager
  class ProductsController < Manager::BaseController
    def index
      @products = Product.page(params[:page]).order(created_at: :desc)
    end

    def show; end

    def new
      @product = Product.new
      @image = @product.images.build
    end

    def create
      @product = Product.new product_params.merge(admin_id: current_admin.id)
      if @product.save
        params[:product][:images].each do |image|
          @product.images.create file: image
        end
        redirect_to manager_products_path, notice: "Product was successfully created."
      else
        render :new
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.update product_params
        flash[:success] = "Products updated"
        redirect_to manager_products_path
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      flash[:success] = "Product Deleted"
      redirect_to manager_products_path
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity,
                                      images_attributes: %i[file product_id])
    end
  end
end
