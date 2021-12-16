class Admin::MembersController < ApplicationController

  def index
    @member = Member.all
  end

  def show
    @member = Member.find_by(username: params[:username])
    @reviews = @member.reviews
  end

  def edit
    @member = Member.find_by(username: params[:username])
  end

  def update
    @member = Member.find_by(username: params[:username])
    if @member.update(member_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to "/admin/#{current_member.username}"
    else
      flash[:alert] = "会員情報を更新できませんでした。"
      render :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:username, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :profile_image, :introduction, :is_deleted)
  end

end
