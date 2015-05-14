class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates_presence_of(:name)
  validates_length_of(:name, {:maximum => 20})
  # validates(:name, {:presense => true, :length => { :maximum => 20}})
  validates_format_of(:name, :with => /\A[-a-z]+\Z/)
  before_save(:name_capitalize)


  private
    define_method(:name_capitalize) do
    self.name=(name().capitalize)
  end
end
