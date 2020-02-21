class UsersController < ApplicationController

  def search
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

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
