require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  context "Should get home" do 
    it "should render home page" do 
      get root_path
      expect(response).to be_successful
      expect(response).to render_template :home
    end 
  end 
end
