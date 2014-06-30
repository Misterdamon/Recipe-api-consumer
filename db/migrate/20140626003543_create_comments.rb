class CreateComments < ActiveRecord::Migration
  create_table :comments do |c|
    c.text :body
    c.belongs_to :recipe
    c.timestamps
  end
end
