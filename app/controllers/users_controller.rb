class UsersController < ApplicationController
  def index
    @products = Product.all.order(created_at: "DESC").includes(:host)
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
