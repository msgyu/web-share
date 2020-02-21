class UsersController < ApplicationController

  def index
    @products = Product.order(created_at: "DESC").includes(:host).page(params[:page]).without_count.per(1)
  end

  def new
  end

  def registration
  end

  def create
  end

  def show
  end
end
