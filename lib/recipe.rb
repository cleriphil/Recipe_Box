class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  has_and_belongs_to_many(:ingredients)
  validates_presence_of(:name)
  validates_length_of(:name, {:maximum => 20})
  Recipe.order(rating: :desc)
  before_save(:name_capitalize)
  # validates(:name, {:presence => true, :length => {:maximum => 50}})
  # validates(:rating, {:numericality => true, :less_than_or_equal_to => 10})
  # validates_numericality_of :rating, on: create





  private
    define_method(:name_capitalize) do
    self.name=(name().capitalize)
  end
end
