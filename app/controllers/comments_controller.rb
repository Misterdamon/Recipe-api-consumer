class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.new(body: params[:comment][:body])
    @recipe.comments << @comment
    respond_to do |format|
      format.json {render json: {body: @comment.body, votes: @comment.votes}}
    end
  end

  def edit
    @comment = Comment.find(params[:id])
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
    recipe = Recipe.find(params[:recipe_id])
    comment = Comment.find(params[:id])
    comment.votes += 1
    comment.save
    respond_to do |format|
      format.json {render json: {votes: comment.votes}}
    end
  end

  def downvote
    recipe = Recipe.find(params[:recipe_id])
    comment = Comment.find(params[:id])
    comment.votes -= 1
    comment.save
    respond_to do |format|
      format.json {render json: {votes: comment.votes}}
    end
  end
end