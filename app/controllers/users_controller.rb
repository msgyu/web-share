class UsersController < ApplicationController

  def index
    @users = User.order(created_at: "DESC").page(params[:page]).without_count.per(5).joins(:products).preload(:products).distinct
  end

  def search
    @users = User.order(created_at: "DESC").page(params[:page]).without_count.per(5).joins(:products).preload(:products).distinct
  end

  def new
  end

  def registration
  end

  def create
  end

  def mypage
    @sn = Sn.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
end
