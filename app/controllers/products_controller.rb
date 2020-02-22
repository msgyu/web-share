class ProductsController < ApplicationController

  def index    
  end

  def show
  end

  def new
    @product = Product.new
  end

  def get_category_children
    @children = Category.find(params[:parent_id]).children
  end

  def get_categry_grandchildren
    @grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to user_path(current_user.id), notice:"投稿完了"
    else
      render "new"
    end
  end

  private
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :period,
      :price
    )
    .merge(host_id: current_user.id)
  end

end
