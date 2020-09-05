class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_product, only: [:show, :destroy, :update, :edit]
  before_action :set_category, only: [:new,:create, :edit, :update]
  def index
  end

  def show
    @product = Product.find(params[:id])
    @card = Creditcard.where(user_id: current_user.id).first if Creditcard.where(user_id: current_user.id).present?
    if @card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:private_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(customer.default_card)
      @card_brand = @card_info.brand
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 
      case @card_brand
      when "Visa"
        @card_image = "visa.svg"
      when "JCB"
        @card_image = "jcb.svg"
      when "MasterCard"
        @card_image = "master-card.svg"
      when "American Express"
        @card_image = "american_express.svg"
      when "Diners Club"
        @card_image = "dinersclub.svg"
      when "Discover"
        @card_image = "discover.svg"
      end
    end
  end

  def new
    @product = Product.new
    @product.images.build
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
    if @product.valid?
      @product.save
      redirect_to mypage_users_path, notice:"投稿完了"
    else
      flash.now[:alert] = '失敗しました'
      render "new"
    end
  end

  def edit
    @product = Product.find(params[:id])
    @parents = Category.where(ancestry: nil)
  end

  private
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :period,
      :price,
      category_ids: [],
      images_attributes: [:name, :id]
    )
    .merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @parents = Category.where(ancestry: nil)
  end

end
