class CreateRecipeTable < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:catagory_id, :integer)
      t.column(:rating, :integer)
      t.timestamps()
    end
  end
end
