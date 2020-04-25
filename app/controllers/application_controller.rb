class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :firstname, :lastname, :firstname_kana, :lastname_kana, :birth_year, :birth_month, :birth_day, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :firstname, :lastname, :firstname_kana, :lastname_kana, :birth_year, :birth_month, :birth_day, :phone_number, :avatar, :title, :profile, :cando])
  end

  def set_search
    @search = User.ransack(params[:q]) #ransackメソッド推奨
    @search_users = @search.result(distinct: true).order(created_at: "DESC").page(params[:page]).without_count.per(5).joins(:products).preload(:products).distinct
  end
end
