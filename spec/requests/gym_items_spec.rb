require 'rails_helper'

RSpec.describe "GymItems", type: :request do
  context 'Create new equipment' do 
    it 'should create a new equipment when valid information inputted' do 
      expect {
        post gym_items_path, params: { gym_item: { name: 'Treadmill', 
                                                   description: 'Running machine',
                                                   focus: 'cardio' } }
      }.to change { GymItem.count }.by 1
    end 

    it 'should redirect to home page when new equipment created' do 
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
    it 'should not create new equipment when invalid information provided' do 
      expect {
        post gym_items_path, params: { gym_item: { name: 'Treadmill', 
                                                   description: '',
                                                   focus: 'nonsence' } }
      }.to change {GymItem.count}.by 0
      expect(response).to render_template 'static_pages/home'
    end 
  end

  context 'Delete equipment' do 
    it 'should delete equipment from db' do 
      gym_item = GymItem.create!(name: 'ball', description: 'ball', id: 1, focus: 'auxiliary', in_use: false)
      expect {
        delete gym_item_path gym_item 
      }.to change {GymItem.count }.by(-1)
    end
    it 'should create flash' do 
      gym_item = GymItem.create!(name: 'ball', description: 'ball', id: 1, focus: 'auxiliary', in_use: false)
      delete gym_item_path gym_item 
      expect(flash[:success]).to eq 'Removed Gym Equipment'
    end 
    it 'should redirect to home page' do 
      gym_item = GymItem.create!(name: 'ball', description: 'ball', id: 1, focus: 'auxiliary', in_use: false)
      delete gym_item_path gym_item 
      expect(response).to redirect_to root_url
    end 
  end 

  context 'Edit equipment' do 
    it 'should get edit page' do 
      gym_item = GymItem.new(name: 'Treadmill',
                             description: 'Running Machine',
                             focus: 'cardio')
      gym_item.save 
      get edit_gym_item_path(gym_item)
      expect(response).to render_template 'gym_items/edit'
    end

    it 'success should update equipment and redirect to root' do 
      gym_item = GymItem.new(name: 'Treadmill',
                             description: 'Running Machine',
                             focus: 'cardio')
      gym_item.save 
      patch gym_item_path(gym_item), params: { gym_item: { name: gym_item.name,
                                                           description: 'Woohoo',
                                                           focus: gym_item.focus } }
      expect(gym_item.reload.description).to eq 'Woohoo'
      expect(response).to redirect_to root_url
    end

    it 'failure should not update equipment and re-render edit' do 
      gym_item = GymItem.new(name: 'Treadmill',
                             description: 'Running Machine',
                             focus: 'cardio')
      gym_item.save 
      patch gym_item_path(gym_item), params: { gym_item: { name: gym_item.name,
                                                           description: '',
                                                           focus: gym_item.focus } }
      expect(gym_item.reload.description).to eq 'Running Machine'
      expect(response).to render_template 'gym_items/edit'
    end
  end

end
