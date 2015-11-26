class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show,:edit,:update,:destroy]
  after_action :confirm_msg, only: [:create,:update,:destroy]
  def index
    @recipes=Recipe.all.order("created_at DESC")
  end
  
  def show
  end
  
  def new
    @recipe=Recipe.new
  end
  
  def create
    @recipe=Recipe.new(recipe_params)
    @recipe.chef=Chef.find(2)
    
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  def find_recipe
    @recipe=Recipe.find(params[:id])
  end
  
  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end
  
  def confirm_msg
    flash[:success]="Action completed successfully"
  end 
  
  private
    def recipe_params
      params.require(:recipe).permit(:name,:summary,:decsription)
    end
end