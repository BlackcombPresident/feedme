class CreateToolCriteria < ActiveRecord::Migration
  def change
    create_table :tool_criteria do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
