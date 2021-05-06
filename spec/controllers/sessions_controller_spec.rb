require 'rails_helper'

describe SessionsController do
  describe "POST create" do
    it 'creates a session user_id when logging in' do
      # expect{
      #     post :create, params: { :coupon => { :coupon_code => "ASD123", :store => "Dean and Deluca" } }
      #   }.to change(Coupon,:count).by(1)
    end

    it 'redirects to the root index' do
      # post :create, params: { :coupon => { :coupon_code => "ASD123", :store => "Dean and Deluca" } }
      #   expect(response).to redirect_to Coupon.last
    end
  end
end

# users can login
# users can logout
