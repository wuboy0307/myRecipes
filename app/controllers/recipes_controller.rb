class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show,:edit,:update,:destroy,:like]
  before_action :require_same_user, only: [:edit,:update]
  before_action :require_user, except: [:show,:index]
  after_action :confirm_msg, only: [:create,:update,:destroy]
  def index
    @recipes=Recipe.paginate(page: params[:page],per_page: 2)
    #@recipes=Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse ---for recipes based on no of likes
    #@recipes=Recipe.all.order("created_at DESC") ----for recipes based on created time
  end
  
  def show
    
  end
  
  def new
    @recipe=Recipe.new
  end
  
  def create
    @recipe=Recipe.new(recipe_params)
    @recipe.chef=current_user
    
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
  
  def like
    like=Like.create(like: params[:like],chef: current_user,recipe: @recipe)
      if like.valid?
        flash[:success]="Action Completed Successfully"
        redirect_to :back
      else
        flash[:danger]="You can only like/dislike only once"
        redirect_to :back
      end
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:name,:summary,:decsription,:picture)
    end
    def require_same_user
     if current_user != @recipe.chef
       flash[:danger]="You can only edit your own profile"
       redirect_to root_path
     end
    end
end