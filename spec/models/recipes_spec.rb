describe Recipe do
  let!(:r1){
    Recipe.create!(title: "1", content: "2")
  }
  
  it "is invalid without a title" do
    expect(Recipe.new(title: nil)).to have(1).errors_on(:title)
  end

  it "is invalid without body content" do
    expect(Recipe.new(content: nil)).to have(1).errors_on(:content)
  end

  it "is invalid if title is a duplicate" do
    recipe2 = Recipe.create(title: "1")
    expect(recipe2).to have(1).errors_on(:title)
  end

  it "is invalid if content is a duplicate" do
    recipe2 = Recipe.create(content: "2")
    expect(recipe2).to have(1).errors_on(:content)
  end
end
    # These are good tests.  You're off to a good start.
    # I might recommend you look into Factory Girl.  It lets you do
    # something like

    # r1 = create(:recipe)
    # r2 = create(:recipe, id: r1.id)
    #

    # ALSO: note that in several spots you're re-creating the same
    # thing (recipe1).  Look into RSpec's let!()
    #
    # Your friend,

    # Steven