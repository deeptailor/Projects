class ContactsController < ApplicationController

  def index
    render json: Contact.all
  end

  def create
    Contact.create!(username: params['username'])
    render json: Contact.all
  end

  def update
    render json: params
    id = params['id'].to_i
    username = params['username']
    Contact.update(id: id, username: name)
    render json: Contact.all
  end

  def show
    render json: Contact.find(params[:id])
  end

  def destroy
    id = params['id'].to_i
    Contact.destroy(id)
    render json: Contact.all
  end

  private
  # def parse(object)
  #   object
  #
  # end
end
