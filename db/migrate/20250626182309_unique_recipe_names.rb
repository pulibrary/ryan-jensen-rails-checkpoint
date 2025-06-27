class UniqueRecipeNames < ActiveRecord::Migration[8.0]
  def change
    add_index :recipes, :name, unique: true
  end
end
