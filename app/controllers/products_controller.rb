class ProductsController < ApplicationController

  def index    
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @parents = Category.where(ancestry: nil)
  end

  def get_category_children
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end

  def get_categry_grandchildren
    respond_to do |format|
      format.html
      format.json do
        @grandchildren = Category.find(params[:child_id]).children
      end
    end
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
      :price,
      category_ids: []
    )
    .merge(host_id: current_user.id)
  end

end
