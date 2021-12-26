# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :member_state, only: [:create]

  def after_sign_in_path_for(_resource)
    hotels_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def member_state
    @member = Member.find_by(email: params[:member][:email]) # 入力された値をMemberテーブルのemailカラムから探す
    return unless @member # 値がemailカラムにあったら次の処理へ、なかったら処理の終了

    if @member.valid_password?(params[:member][:password]) && @member.is_deleted # 入力されたpasswordの値がMemberテーブルのpasswordカラムに存在する、かつそのレコードのis_deletedカラムがTrueだった場合次の処理へ
      flash[:alert] = '退会済みのアカウントです。'
      redirect_to new_member_registration_path # 会員登録画面へ遷移
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
