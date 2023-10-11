require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  context "Should get home" do 
    it "should render home page" do 
      get root_path
      expect(response).to be_successful
      expect(response).to render_template :home
    end 
  end 

  context "Search by name" do 
    it 'successful search should return one item' do 
      treadmill = GymItem.create(name: 'treadmill', description: 'running machine', focus: 'cardio')
      lat_pull_down = GymItem.create(name: 'lat pull down', description: 'lat muscles', focus: 'strength-upper')

      post search_path, params: { search: { name: 'Treadmill' } }
      expect(assigns(:gym_items)[0]).to eq treadmill 
      expect(response).to render_template 'home'
    end
    it 'unsuccessful search should return empty list' do 
      treadmill = GymItem.create(name: 'treadmill', description: 'running machine', focus: 'cardio')
      lat_pull_down = GymItem.create(name: 'lat pull down', description: 'lat muscles', focus: 'strength-upper')

      post search_path, params: { search: { name: 'banana' } }
      expect(assigns(:gym_items).count).to eq 0
      expect(response).to render_template 'home'
    end
  end

  context "filter" do 
    it 'successfully toggle cardio' do 
      get root_url 
      get filter_path(filter: 'cardio')
      expect(session[:cardio]).to eq false
      expect(response).to redirect_to root_url
    end
    it 'successfully toggle strength-upper' do
      get root_url
      get filter_path(filter: 'strength_upper')
      expect(session[:strength_upper]).to eq false
      expect(response).to redirect_to root_url
    end
    it 'successfully toggle strength-lower'do 
      get root_url
      get filter_path(filter: 'strength_lower')
      expect(session[:strength_lower]).to eq false
      expect(response).to redirect_to root_url
    end 
    it 'successfully toggle auxiliary' do 
      get root_url 
      get filter_path(filter: 'auxiliary')
      expect(session[:auxiliary]).to eq false
      expect(response).to redirect_to root_url
    end
  end
end
