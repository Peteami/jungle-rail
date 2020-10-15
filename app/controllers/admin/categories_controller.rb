class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(catogory_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'New Category Created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(
      :name,
      :created_at,
      :updated_at
    )
  end
end
