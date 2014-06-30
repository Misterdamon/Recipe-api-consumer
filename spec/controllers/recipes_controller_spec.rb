require 'spec_helper'

describe RecipesController  do
  let!(:recipe) {
    FactoryGirl.create(:recipe)
  }
  it '#index should show all recipes' do
    get :index
    expect(assigns(:recipes)).to eq([recipe])
  end

  it '#show have the right recipe to render in the template' do
    get :show, id: recipe
    expect(assigns(:recipe)).to eq(recipe)
  end

  it '#show should render the show template for the right recipe' do
    get :show, id: recipe
    expect(response).to render_template :show
  end

  it '#new should render the new template form' do
    get :new
    @recipe = Recipe.new
    expect(response).to render_template :new
  end

  it '#create should properly create a recipe' do
    expect {
      post :create, recipe: FactoryGirl.attributes_for(:recipe)
    }.to change(Recipe, :count).by(1)
  end

  it '#edit should render the edit form' do
    get :edit, id: recipe
      expect(response).to render_template :edit
    end

  it "#update should properly update attributes" do
    put :update, id: recipe.id
    expect(assigns(:recipe)).to eq(recipe)
  end

  it "#destroy should properly destroy a recipe" do
    r2 = FactoryGirl.create(:recipe)
    expect {
      post :destroy, id: r2
    }.to change(Recipe, :count).by(-1)
  end

  context "voting" do
    it "increments the vote count for an upvote on a recipe" do
      recipe2 = Recipe.create(title:"6",content:"5", votes:4)
      put :upvote, id: recipe2.id
      expect(recipe2.reload.votes).to eq(5)
    end

    it "decrements the vote count for a downvote on a recipe" do
      recipe2 = Recipe.create(title:"6",content:"5", votes:4)
      put :downvote, id: recipe2.id
      expect(recipe2.reload.votes).to eq(3)
    end


  end
end