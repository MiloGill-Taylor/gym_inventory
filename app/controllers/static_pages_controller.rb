class StaticPagesController < ApplicationController
  def home
    @gym_item = GymItem.new
    @gym_items = GymItem.paginate(page: params[:page], per_page: 5)
  end
end
