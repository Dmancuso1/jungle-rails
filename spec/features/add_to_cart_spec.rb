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
  
    User.create!(
    name: "Charlie",
    email: "charlie@charlie.com",
    password: "password")
  end
    
    
    
  scenario "cart increase by one when product added" do
    # ACT
    visit root_path
    within first('.product') do
      click_button 'add_btn'
    end
    # user must be looged in to use 'add to cart' button.
    # enter valid username
    fill_in 'email', with: 'charlie@charlie.com'
    # enter valid user password
    fill_in 'password', with: 'password'
    # click submit button
    click_on 'Submit'
    
    # DEBUG / VERIFY
    # check that shopping cart has '0' items.
    expect(page).to have_text(' My Cart (0)')

    # click_button 'add_btn'
    within first('.product') do
      click_button 'add_btn'
    end
    
    # VERIFY
    expect(page).to have_text(' My Cart (1)')
    # check that shopping cart has '1' item.
    save_and_open_screenshot('add_to_cart_spec.png')
  end

end