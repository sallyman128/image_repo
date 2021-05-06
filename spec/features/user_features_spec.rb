require 'rails_helper'

describe 'Route to view' do
  it 'has an index page' do
    visit coupons_path
    expect(page.status_code).to eq(200)
  end
end