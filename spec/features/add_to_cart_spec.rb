require 'rails_helper'

RSpec.feature "Visitor adds first item to empty cart from homepage", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They increase their cart count from 0 to 1" do
    visit root_path
    expect(page).to have_content 'My Cart (0)'


    page.first('article.product').click_on 'Add'
    expect(page).to have_content 'My Cart (1)'
  end

end


