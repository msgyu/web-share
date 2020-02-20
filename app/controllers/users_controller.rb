class UsersController < ApplicationController
  def index
    @products = Product.all.order(created_at: "DESC").includes(:host).page(params[:page]).without_count.per(2)
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
