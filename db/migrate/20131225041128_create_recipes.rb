class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :directions
      t.integer :protein
      t.integer :fat
      t.integer :carbs
      t.integer :cost
      t.text :criteria
      t.integer :prep_time
      t.integer :cook_time
      t.integer :calories

      t.timestamps
    end
  end
end
