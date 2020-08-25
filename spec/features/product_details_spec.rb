require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('furniture3.jpg'),
        quantity: 10,
        price: 64.99
        )
      end
    end
    
    
    
  scenario "clicking details takes them to product show page" do
    # ACT
    visit root_path
    within first('.product') do
      click_link 'Details »'
    end
    
    
    # DEBUG / VERIFY
    # puts page.html
    
    # VERIFY
    expect(page).to have_css('.product-detail')
    save_and_open_screenshot('product-details-spec.png')
  end

end