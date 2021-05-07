require 'rails_helper'

describe UsersController do
  describe "POST create" do
    it 'creates a new user' do
      expect{
          post :create, params: { :user => { :username => "KingTrident", :password => "toupee" } }
        }.to change(User,:count).by(1)
    end

    it 'redirects to the root index' do
      post :create, params: { :user => { :username => "KingTrident", :password => "toupee" } }
      expect(response).to redirect_to images_path
    end
  end
end