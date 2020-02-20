class CreditcardsController < ApplicationController
  require "payjp"

  def index
  end

  def new
    @card = Creditcard.where(user_id: current_user.id).first
    redirect_to action: "index" if @card.present?    
  end

  def create
  end

  def destroy
  end
end
