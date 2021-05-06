require 'rails_helper'

describe 'features of image views' do
  before do 
    @user = User.create(username: "Spongebob", password: "squarepants")
    @image = @user.images.build
    @image.picture.attach(
      io: File.open("app/assets/images/african-elephant-close-up.jpg"), 
      filename: "african-elephant-close-up.jpg"
    )
    @image.save
  end

  it 'has an index page' do
    visit images_path
    expect(page.status_code).to eq(200)
  end

  it 'has a show page' do
    visit image_path(@image)
    expect(page.status_code).to eq(200)
  end

  context 'with a user that is not logged in' do
    it 'redirects to login if user is trying to create new image' do
      visit logout_path
      visit new_image_path
      expect(page).to have_content("Login Page")
    end

    it 'prevents user from deleting image from image#show page' do
      visit logout_path
      visit image_path(@image)
      expect(page).not_to have_content("Delete")
    end
  end

  context 'with a user that is logged in' do
    it 'access a new image page' do
      visit login_path
      fill_in 'username', with: @user.username
      fill_in 'password', with: @user.password
      click_on "Log in"

      visit new_image_path
      expect(page).to have_content("New Image")
    end

    it 'user can delete their image from image#show page' do
      visit login_path
      fill_in 'username', with: @user.username
      fill_in 'password', with: @user.password
      click_on "Log in"

      visit image_path(@image)
      expect(page).to have_content("Delete")
    end

    it 'user cannot delete another user image from image#show page' do
      user2 = User.create(username: "Patrick", password: "wumbo")
      visit login_path
      fill_in 'username', with: user2.username
      fill_in 'password', with: user2.password
      click_on "Log in"

      visit image_path(@image)
      expect(page).not_to have_content("Delete")
    end
  end
end