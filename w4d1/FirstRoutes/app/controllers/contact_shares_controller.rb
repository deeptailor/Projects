class ContactSharesController < ApplicationController
  def index
    render json: ContactShare.all
  end

  def create
    user_id = params['user_id']
    contact_id = params['contact_id']
    ContactShare.create!(user_id: user_id, contact_id: contact_id)

    render json: ContactShare.all
  end

  def destroy
    contact_share = ContactShare.find_by(params.permit(:id))
    contact_share.destroy
  end





  private
  def permit(params)
    params.require(:contact_share).permit(:id)
  end
end
