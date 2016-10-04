class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end


  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      render :show, :status => :created
    else
      render(
        :json => @cat.errors.full_messages,
        :status => :unprocessable_entity
      )
    end
  end

  # goes here first
  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  #goes here next
  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      render :show, :status => :created
    else
      render(
        :json => @cat.errors.full_messages,
        :status => :unprocessable_entity
      )
    end
  end


  private

  def cat_params
    params.require(:cat).permit(:id, :birth_date, :color, :name, :sex, :description)
  end
end
