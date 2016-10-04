
class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    User.create!(username: params['username'])
    render json: User.all
  end

  def update
    render json: params
    id = params['id'].to_i
    username = params['username']
    User.update(id: id, username: name)
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def destroy
    id = params['id'].to_i
    User.destroy(id)
    render json: User.all
  end


  def find_contacts
    self.contacts
  end

  private
  # def parse(object)
  #   object
  #
  # end
end
