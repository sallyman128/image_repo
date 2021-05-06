require 'rails_helper'

describe "Image" do

  before do
    @user = User.create(username: "Spongebob", password: "squarepants")
    @image = @user.images.build
    @image.picture.attach(
      io: File.open("app/assets/images/african-elephant-close-up.jpg"), 
      filename: "african-elephant-close-up.jpg"
    )
    @image.save
  end

  it "has a picture attached" do
    expect(@image.picture).to be_attached
  end

  it "belongs to a user" do
    expect(@user.images).to include(@image)
  end
end
