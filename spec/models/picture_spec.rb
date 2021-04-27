require 'rails_helper'

Rspec.describe Picture, type: :model do
  picture = Picture.new(
    name: "picture of a baby elephant",
    image: "" #an image url
  )

  it 'has a valid image attribute' do
    expect(picture).to be_valid
  end

  it 'is invalid if that image already exists' do 
    duplicate_picture = Picture.new(
      name: "Same picture of a baby elephant",
      image: "" #an image url
    )

  end
end