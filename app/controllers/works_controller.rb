class WorksController < ApplicationController
  before_action :authenticate_user!, except: (:index)
  
  def index
    #모든 작품을 보여준다.
    @works=Work.all
  end

  def new
    @makers=Maker.all
  end

  def create
    work = Work.new(
      title: params[:title],
      desc: params[:desc],
      image: params[:image],
      maker_id: params[:maker_id]
      )
    if work.save
      redirect_to work_path(work)
    else
      flash[:msg] = "제목 혹은 내용이 비어있으면 안돼요~"
      redirect_to new_work_path
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update(
      title: params[:title],
      desc: params[:desc],
      image: params[:image],
      maker_id: params[:maker_id]
      )
      
      redirect_to work_path(work)
      
      
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to :back
  end
  

end
