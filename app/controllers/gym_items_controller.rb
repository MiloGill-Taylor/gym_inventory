class GymItemsController < ApplicationController

	def create
		@gym_item = GymItem.new(gym_item_params)
		if @gym_item.save 
			flash[:success] = 'New equipment successfuly acquired'
			redirect_to root_url, status: :see_other
		else 
			@gym_items = GymItem.paginate(page: params[:page], per_page: 5)
			render 'static_pages/home', status: :unprocessable_entity
		end 
	end 

	def edit
	end 

	def update
	end 

	def destroy 
		gym_item_to_destroy = GymItem.find(params[:id])
		gym_item_to_destroy.destroy
		flash[:success] = 'Removed Gym Equipment'
		redirect_to root_url, status: :see_other
	end

	private 
		def gym_item_params 
			params.require(:gym_item).permit(:name, :focus, :description)
		end  
end
