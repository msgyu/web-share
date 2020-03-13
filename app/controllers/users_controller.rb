class UsersController < ApplicationController

  def index
    @hosts = User.order(created_at: "DESC").page(params[:page]).without_count.per(5).joins('LEFT JOIN Products ON users.id = products.host_id').where('products.id IS NOT NULL').distinct
    # @hosts = User.joins('LEFT JOIN Products ON users.id = products.host_id').where('products.id IS NOT NULL')
    # @hosts = User.order(created_at: "DESC").page(params[:page]).without_count.per(5)
  end

  def search
    @products = Product.order(created_at: "DESC").includes(:host).page(params[:page]).without_count.per(5)
  end

  def new
  end

  def registration
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
end
