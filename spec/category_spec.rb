require('spec_helper')

describe(Category) do
  describe('#recipes') do
    it('will return the recipes in a category') do
      recipe1 = Recipe.create({:name => 'pizza', :rating => 3})
      recipe2 = Recipe.create({:name => 'spaghetti', :rating => 2})
      category = Category.new({:name => 'italian', :recipe_ids => [recipe1.id(), recipe2.id()]})
      expect(category.recipes()).to(eq([recipe1, recipe2]))
    end
  end

  it('validates presence of description') do
    category = Category.new({:name => ""})
    expect(category.save()).to(eq(false))
  end
end
