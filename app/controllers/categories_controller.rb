class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ destroy delete_confirmation ]
  before_action :redirect_unless_signed_in

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end
  

  def delete_confirmation
  end

  def create
    create_params = category_params.merge(user_id: current_user.id)

    @category = Category.new(create_params)
    if @category.save
      redirect_to categories_path, alert: "New category added successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to events_path, alert: "Category was successfully destroyed." }
    end
  end

  private

  def set_category
    puts "Params:"
    puts params
    @category = Category.find(params[:id])
  end

  def category_params 
    params.require(:category).permit(:name)
  end

  def redirect_unless_signed_in
    unless user_signed_in?
      redirect_to root_path 
    end
  end

end
