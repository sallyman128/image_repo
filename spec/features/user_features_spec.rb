require 'rails_helper'

describe 'User features:' do
  before do 
    @user = User.create(username: "Spongebob", password: "squarepants")
    @image1 = @user.images.build
    @image1.picture.attach(
      io: File.open("app/assets/images/african-elephant-close-up.jpg"), 
      filename: "african-elephant-close-up.jpg"
    )
    @image1.save
    @image2 = @user.images.build
    @image2.picture.attach(
      io: File.open("app/assets/images/elephant-with-amber-eyes.jpg"), 
      filename: "elephant-with-amber-eyes.jpg"
    )
    @image2.save
  end

  it 'has a show page' do
    visit user_path(@user)
    expect(page.status_code).to eq(200)
  end

  it 'lets user sign up' do
    # user = User.new(username: "squidward", password: "clarinet")

    visit new_user_path
    fill_in 'username', with: "squidward"
    fill_in 'password', with: user.password
    click_on "Sign up"

    expect().to change(User, :count).by(1)
    # expect {
      #     post :create, params: { image: { user_id: user.id , picture: blob_for('african-elephant-close-up.jpg') } }
      #   }.to change(Image, :count).by(1)

    # expect(page).to have_content(""@user.username)
  end
end
