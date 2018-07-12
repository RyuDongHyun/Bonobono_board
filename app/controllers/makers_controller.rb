class MakersController < ApplicationController
  before_action :set_maker, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  
  def index
    @makers = Maker.all
  end

  def new
  end

  def create
    maker = Maker.new(
      name: params[:name],
      phone_number: params[:phone_number],
      email: params[:email]
      )
    if maker.save
      redirect_to makers_path
    else
      flash[:msg] = "필수항목을 입력하세요."
      redirect_to new_maker_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @maker.update(
      name: params[:name],
      phone_number: params[:phone_number],
      email: params[:email]
      )
      redirect_to maker_path(@maker)
  end

  def destroy
    @maker.destroy
    redirect_to :back
  end
  
  private
  def set_maker
    @maker=Maker.find(params[:id])
  end
end
