class CreateRecipes < ActiveRecord::Migration
  create_table :recipes do |r|
    r.string :title
    r.text :content
    r.string :image_url
    r.timestamps
  end
end
