class Recipe < ActiveRecord::Base
	has_many :ingredients
	accepts_nested_attributes_for :ingredients, 
		reject_if: :all_blank, 
		:allow_destroy => true
	
	validates :title, 
		:directions, 
		:protein, 
		:fat, 
		:carbs, 
		:prep_time, 
		:cook_time, 
		:presence => true

	validate do
		check_for_ingredients
	end

	private
	def check_for_ingredients
		unless ingredients.count >= 1
			errors.add(:base, 'Recipes must contain at least one ingredient')
		end
	end
end

