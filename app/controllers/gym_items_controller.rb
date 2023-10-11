class GymItemsController < ApplicationController

	def create
		@gym_item = GymItem.new(gym_item_params)
		if @gym_item.save 
			flash[:success] = 'New equipment successfuly acquired'
			redirect_to root_url, status: :see_other
		else 
			render 'static_pages/home', status: :unprocessable_entity
		end 
	end 

	def edit
	end 

	def update
	end 

	def destroy 
	end

	private 
		def gym_item_params 
			params.require(:gym_item).permit(:name, :focus, :description)
		end  
end
