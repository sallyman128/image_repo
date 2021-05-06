require 'rails_helper'

describe 'Route to view' do
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
end
