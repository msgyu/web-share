class UsersController < ApplicationController

  def index
    @products = Product.order(created_at: "DESC").includes(:host).page(params[:page]).without_count.per(5)
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
end
