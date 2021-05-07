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
    visit new_user_path

    fill_in 'user_username', with: "squidward"
    fill_in 'user_password', with: "clarinet"
    click_on "Create User"

    expect(page).to have_content("Logged in as: squidward")
  end

  it 'lets user log in' do
    visit login_path
    fill_in "username", with: @user.username
    fill_in "password", with: @user.password
    click_on "Log in"

    expect(page).to have_content("Logged in as: #{@user.username}")
  end

  it 'lets user log out' do
    visit logout_path
    expect(page).to have_content("logged out")
  end
end
