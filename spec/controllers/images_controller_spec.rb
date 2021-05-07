require 'rails_helper'
require_relative '../helpers/images_controller_helper'

describe ImagesController do
  describe "POST create" do
    # cannot simulate attaching a picture to Image instance

    # it 'creates a new image' do
    #   user = User.create(username: "coolUsername", password: "notpassword123")
    #   expect {
    #     post :create, params: { image: { user_id: user.id , picture: blob_for('african-elephant-close-up.jpg') } }
    #   }.to change(Image, :count).by(1)
    # end

    # it 'redirects to the new image' do
      # same code as above
      # expect(response).to redirect_to image_path(Image.last)
    # end

    # it 'renders image_new form after failed create' do
    #   post :create, params: { image: { user_id: user.id , picture: blob_for('african-elephant-close-up.jpg') } }    #   expect(response).to redirect_to new_image_path
    #   expect(response).to redirect_to new_image_path
    # end
  end
end