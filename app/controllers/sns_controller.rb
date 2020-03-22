class SnsController < ApplicationController
  require 'mechanize'

  def new
    @sns = Sn.new    
  end

  def mechanize(sns)
    @sns = Sn.find(sns.id)
    agent = Mechanize.new
    page = agent.get("#{sns.url}")
    title = page.search('.ytd-channel-name').inner_text
    follower = page.search('.ytd-c4-tabbed-header-renderer').inner_text
    @sns.update(follower: follower)
  end

  def create
    @sns = Sn.new(sns_params)
    if @sns.save
      redirect_to mypage_users_path, notice:"投稿完了"
    else
      render "new"
    end
  end

  def destroy
    @sns = Sn.find(params[:id])
    @sns.destroy
  end

  private

  def sns_params
    params.require(:sn).permit(
      :kind,
      :url
    )
    .merge(user_id: current_user.id)
  end
end
