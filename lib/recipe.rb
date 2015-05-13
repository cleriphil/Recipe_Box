class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:category)
  has_and_belongs_to_many(:ingredients)
end
