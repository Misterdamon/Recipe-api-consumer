require 'spec_helper'



feature 'View recipes' do
  scenario "user can see recipes and create new recipes if logged in" do
    recipe = FactoryGirl.create(:recipe)
    visit recipes_path
    click_link recipe.title

    expect(page).to have_content recipe.title
  end
end

feature 'Create comment' do
  scenario "a comment is not saved if the body is nil or blank" do
    recipe = FactoryGirl.create(:recipe)
    visit new_recipe_comments_path(recipe)
    fill_in "comment[body]", with: ""
    click_button "Create Comment"
    expect(Comment.count).to eq(0)
  end
end