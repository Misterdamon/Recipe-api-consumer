
class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    search_term = params[:recipe][:title]
    response = YummlyAdapter.search(search_term)
    puts response
    response["matches"].empty? ? photo_url = "/images/rails.png" : photo_url = response["matches"][0]["imageUrlsBySize"]["90"]
    @recipe = Recipe.new(title: params[:recipe][:title], content: params[:recipe][:content], image_url: photo_url )
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    Recipe.delete(params[:id])
    redirect_to recipes_path
  end

  def upvote
    recipe = Recipe.find(params[:id])
    recipe.votes += 1
    recipe.save
    respond_to do |format|
      format.json {render json: {votes: recipe.votes}}
    end
  end

  def downvote
    recipe = Recipe.find(params[:id])
    recipe.votes -= 1
    recipe.save
    respond_to do |format|
      format.json {render json: {votes: recipe.votes}}
    end
  end

  def random_list
    @recipes = []
    results = HTTParty.get("http://frozen-ravine-7501.herokuapp.com/api/v1/22da81825c25c4a380dd/recipes")
    results.parsed_response.each do |recipe|
      @recipes << Recipe.create(title: recipe['title'], content: recipe["content"])
    end
  end

  def new_search
    @recipe = Recipe.new
  end

  def search
   puts RecipesAdapter.search(params[:recipe][:content])
  
  end
end