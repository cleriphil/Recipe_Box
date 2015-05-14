class Category < ActiveRecord::Base
  validates_presence_of(:name)
  validates_length_of(:name, {:maximum => 50})
  before_save(:capitalize_name)
  has_and_belongs_to_many(:recipes)

  private

  define_method(:capitalize_name) do
    self.name=(name().capitalize())
  end
end
