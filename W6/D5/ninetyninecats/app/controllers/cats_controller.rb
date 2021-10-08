class CatsController < ApplicationController
  def index
    cats = Cat.all
    render json: cats
  end

  def show
    cat = Cat.find_by(id: params[:id])
    render json: cat
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end

end