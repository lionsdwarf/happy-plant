class RecipientsController < ApplicationController

  before_action :authenticate

  def index
    @recipient = Recipient.all
    @user = User.find(current_user.id)
  end

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new(recipient_params)
    @recipient.user_id = current_user.id
    @recipient.save
    redirect_to user_path(current_user.id)
  end

  def edit
    binding.pry
    @recipient = Recipient.find(params[:id])
  end

  def update
    @recipient = Recipient.find(params[:id])
    @recipient.update(recipient_params)
  end

  def destroy
    @recipient = Recipient.find(params[:id])
    @recipient.destroy
  end

  private

  def recipient_params
    params.require(:recipient).permit(:name, :phone_num)
  end

end