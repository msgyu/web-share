class SnsController < ApplicationController
  def new
    @sns = Sns.new    
  end

  def create
    @sns = Sns.new(sns_params)
    if @sns.save
      redirect_to mypage_users_path, notice:"投稿完了"
    else
      render "new"
    end
  end

  def destroy
    @sns = Sns.find(params[:id])
    @sns.destroy
  end

  private

  def sns_params
    params.require(:sns).permit(
      
      :url,
    )
    .merge(user_id: current_user.id)
  end
end
