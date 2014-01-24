class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
