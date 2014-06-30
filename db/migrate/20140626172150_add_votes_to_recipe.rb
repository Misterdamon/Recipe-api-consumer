class AddVotesToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :votes, :integer, default: 0
  end
end
