class UsersController < ApplicationController

  def index
    @products = Product.order(created_at: "DESC").includes(:host).page(params[:page]).without_count.per(5)
    @hosts = User.joins('LEFT JOIN Products ON users.id = products.host_id').where('products.id IS NOT NULL').uniq
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
