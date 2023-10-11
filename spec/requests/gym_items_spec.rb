require 'rails_helper'

RSpec.describe "GymItems", type: :request do
  context 'Create new equipment' do 
    it 'should create a new equipment when valid information inputted' do 
      post gym_items_path, params: { gym_item: { name: 'Treadmill', 
                                                 description: 'Running machine',
                                                 focus: 'cardio' } }
      expect(GymItem.count).to eq 1
    end 

    it 'should render home page when new equipment created' do 
      post gym_items_path, params: { gym_item: { name: 'Treadmill', 
                                                 description: 'Running machine',
                                                 focus: 'cardio' } }
      expect(response).to redirect_to root_url
    end 

    it 'should cause a flash to appear after successful creation' do 
      post gym_items_path, params: { gym_item: { name: 'Treadmill', 
                                                 description: 'Running machine',
                                                 focus: 'cardio' } }
      expect(flash[:success]).to eq 'New equipment successfuly acquired'   
    end    
  end

end
