class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :create, :edit, :update]


  def new
    @category = Category.new
  end

  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save 
      flash[:notice] = "Category sucessfully created."
      redirect_to @category
    else 
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category name was updated successfully"
      redirect_to @category
    else
      render 'edit'
    end
  end

  @private
  
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    # Use callbacks to share common setup or constraints between actions.
    @category = Category.find(params[:id])
  end

  def require_admin
    if !( logged_in? && current_user.admin? )
      flash[:alert] = "You are not authorize to perform this action."
      redirect_to categories_path
    end
  end
end