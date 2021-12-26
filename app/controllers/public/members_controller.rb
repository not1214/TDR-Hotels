class Public::MembersController < ApplicationController
  before_action :authenticate_member!

  def mypage
    @member = current_member
    @reviews = @member.reviews.page(params[:page]).per(5)
  end

  def show
    @member = Member.find_by(username: params[:username])
    @reviews = @member.reviews.page(params[:page]).per(5)
  end

  def edit
    @member = Member.find_by(username: params[:username])
    if @member != current_member
      flash[:alert] = '不正なアクセスです。'
      redirect_to "/#{@member.username}"
    end
  end

  def update
    @member = current_member
    # binding.pry
    if current_member.update(member_params)
      flash[:notice] = '会員情報を更新しました。'
      redirect_to "/#{current_member.username}"
    else
      flash.now[:alert] = '会員情報を更新できませんでした。'
      render :edit
    end
  end

  def unsubscribe; end

  def withdraw
    @member = current_member
    # binding.pry
    @member.update(is_deleted: true)
    flash[:notice] = '退会しました。'
    reset_session
    redirect_to root_path
  end

  def favorites
    @member = current_member
    @favorites = current_member.favorites.pluck(:hotel_id)
    # binding.pry
    @favorite_hotels = Hotel.find(@favorites)
  end

  private

  def member_params
    params.require(:member).permit(:username, :last_name, :first_name, :last_name_kana, :first_name_kana,
                                   :phone_number, :profile_image, :introduction)
  end
end
