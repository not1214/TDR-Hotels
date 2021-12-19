class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      flash[:notice] = "お問い合わせを送信しました。"
      redirect_to complete_contacts_path
    else
      flash[:alert] = "お問い合わせを送信できませんでした。再度入力してください。"
      render :new
    end
  end

  def complete
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name, :subject, :message)
  end

end
