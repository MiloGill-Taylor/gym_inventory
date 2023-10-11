class StaticPagesController < ApplicationController
  def home
    @gym_item = GymItem.new
  end
end
