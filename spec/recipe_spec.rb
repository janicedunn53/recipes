require('spec_helper')

describe(Recipe) do
  describe('#categories') do
    it("returns the categories of a recipe") do
      category1 = Category.create({:name => "entree"})
      category2 = Category.create({:name => "BBQ"})
      recipe = Recipe.new({:name => "pulled pork", :rating => 4, :category_ids => [category1.id(), category2.id()]})
      expect(recipe.categories()).to(eq([category1, category2]))
    end
  end

  it { should have_many(:ingredients) }
  it { should have_many(:instructions) }

  it('validate the presence of recipe name') do
    recipe = Recipe.new({:name => ""})
    expect(recipe.save()).to(eq(false))
  end

  it('validates the presence of recipe rating') do
    recipe = Recipe.new({:rating => ""})
    expect(recipe.save()).to(eq(false))
  end
end
