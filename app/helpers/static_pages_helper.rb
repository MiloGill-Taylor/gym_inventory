module StaticPagesHelper
	def is_filter_on? filter
		if session[filter]
			'on'
		else
			'off'
		end
	end

	def get_equipment
		filters = []
		filters << 'cardio'		     if session[:cardio] 
		filters << 'strength-lower'  if session[:strength_lower] 
		filters << 'strength-upper'   if session[:strength_upper] 
		filters << 'auxiliary' 	     if session[:auxiliary]
		if filters.count == 4
			GymItem.paginate(per_page: 5, page: params[:page])
		else
			GymItem.where(focus: filters).paginate(per_page: 5, page: params[:page])
		end
	end

	def format_time(time_with_zone)
  		# Convert time to the desired format
  		time_with_zone.strftime('%d/%m/%y %I:%M%P')
	end

end
