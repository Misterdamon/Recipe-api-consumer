require 'spec_helper'

describe CommentsController do
  let(:recipe) { FactoryGirl.create(:recipe) }
  let(:comment) { FactoryGirl.create(:comment) }


  it "#new should render the new comment template" do
    get :new, recipe_id: recipe.id
    expect(response).to render_template :new
  end

  it "#create should successfully create a comment" do
    expect {
      post :create, recipe_id: recipe.id, comment: FactoryGirl.attributes_for(:comment)
    }.to change(Comment, :count).by(1)
  end

  # it "#create should redirect back to the recipe that was commented on" do
  #   post :create, recipe_id: recipe.id, comment: FactoryGirl.attributes_for(:comment)
  #   expect(response).to redirect_to recipe
  # end

  context "voting" do
    it "increments the vote count for an upvote on a comment" do
      comment.recipe_id = recipe.id
      comment.save
      expect{ put :upvote, recipe_id: recipe.id, id: comment.id }.to change { comment.reload.votes }.by(1)
    end

    it "decrements the vote count for a downvote on a comment" do
      comment.recipe_id = recipe.id
      comment.save
      expect{ put :downvote, recipe_id: recipe.id, id: comment.id }.to change { comment.reload.votes }.by(-1)
    end
  end
end