class Public::MembersController < ApplicationController

  def mypage
    redirect_to "/#{current_member.username}"
  end

  def show
    @member = current_member
    @reviews = @member.reviews
  end

  def edit
    @member = current_member
    if @member != current_member
      flash[:alert] = "不正なアクセスです。"
      redirect_to "/#{@member.username}"
    end
  end

  def update
    @member = current_member
    if current_member.update(member_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to "/#{current_member.username}"
    else
      flash[:alert] = "会員情報を更新できませんでした。"
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:username, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :profile_image, :introduction)
  end

end
