# frozen_string_literal: true

module Manager
  class BlogsController < Manager::BaseController
    before_action :check_contributor, only: %i[create new]

    def index
      @blogs = Blog.page(params[:page]).order(created_at: :desc)
    end

    def new
      @blog = Blog.new
    end

    def create
      @blog = current_admin.blogs.build(blog_params)
      if @blog.save
        flash[:success] = "Blog was successfully created"
        redirect_to manager_blogs_path
      else
        render :new
      end
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :content, :image, :description)
    end
  end
end
