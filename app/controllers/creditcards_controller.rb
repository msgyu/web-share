class CreditcardsController < ApplicationController
  require "payjp"

  def index
  end

  def new
    @card = Creditcard.where(user_id: current_user.id).first
    redirect_to action: "index" if @card.present?    
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjpToken'].blank?
      render "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )
      @card = Creditcard.new(user_id: current_user.id, customer_id: customer.id)
        if @card.save
          if request.referer&.include?("/registrations/step5")
            redirect_to controller: 'registrations', action: "step6"
          else
            redirect_to action: "index", notice:"支払い情報の登録が完了しました"
          end
        else
          render 'new'
        end
    end
  end

  def destroy
  end
end
