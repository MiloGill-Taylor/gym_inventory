class StaticPagesController < ApplicationController
  include StaticPagesHelper
  before_action :set_session, only: :home

  def home
    p session[:cardio]
    @gym_item = GymItem.new
    @gym_items = get_equipment
  end

  def search
    @gym_item = GymItem.new
    @gym_items = GymItem.where("name = ?", params[:search][:name].downcase).paginate(page: params[:page])
    render 'home', status: :see_other
  end 

  def filter
    filter = params[:filter]
    session[filter] = !session[filter]
    redirect_to root_url, status: :see_other
  end 

  private 
    def set_session
      filters = [:cardio, :strength_lower, :strength_upper, :auxiliary]
      filters.each do |filter|
        session[filter] = true unless session[filter] == false
      end 
    end 
end
