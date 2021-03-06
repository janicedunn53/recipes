class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  has_many(:ingredients)
  has_many(:instructions)
  validates(:name, :presence => true)
  validates(:rating, :presence => true)
end
