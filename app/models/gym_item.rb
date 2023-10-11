class GymItem < ApplicationRecord
	default_scope { order(name: :asc) }
	before_save :downcase_name_focus
	validates :name, 
			   presence: true,
			   length: { maximum: 255 },
			   uniqueness: { case_sensitive: false }
	validates :description,
			   presence: true
	validates :in_use, 
			   inclusion: [true, false]
	VALID_FOCUS_REGEX = /\A(cardio|strength-(?:lower|upper)|auxiliary)\z/i # Ensures only one focus is present case insensitively
	validates :focus,
	 		   presence: true,
	 		   length: { maximum: 255 },
	 		   format: { with: VALID_FOCUS_REGEX }


	private
		def downcase_name_focus
			self.name.downcase!
			self.focus.downcase!
		end


end
