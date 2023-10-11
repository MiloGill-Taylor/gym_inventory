module GymItemsHelper
	def get_full_focus short_focus 
		if short_focus == 'cardio'
			'Cardiovascular Health'
		elsif short_focus == 'strength-upper'
			'Strengthening upper body'
		elsif short_focus == 'strength-lower'
			'Strengthening lower body'
		else
			'For auxilliary training'
		end 
	end 

	def get_usage in_use
		if in_use
			'In usage'
		else
			'Not in usage'
		end 
	end 

	def get_focusses
		['cardio', 'strength-upper', 'strength-lower', 'auxiliary']
	end
end
