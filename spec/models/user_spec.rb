require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user1 = User.create(username: "Spongebob", password: "squarepants")
  end

  it "is invalid with no username" do
    user = User.new(password: "aGreatPassword")
    expect(user).to be_invalid
  end

  it "has a unique username" do
    user2 = User.new(username: "Spongebob", password: "doodlebob")
    expect(user2).to be_invalid 
  end

  it "is invalid with no password" do
    user = User.new(username: "aGreatUsername")
    expect(user).to be_invalid
  end

  it "has a secure password" do
    raw_password = @user1.password
    persisted_password = @user1.password_digest
    expect(raw_password).not_to eq(persisted_password)
  end

  it "has many images" do
    image1 = @user1.images.build()
    image2 = @user1.images.build()
    images = @user1.images
    expect(@user1.images.size).to be > 0
  end
end


