class ProductsController < ApplicationController

  def index    
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
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
