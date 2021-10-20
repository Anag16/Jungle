require 'rails_helper'

RSpec.feature "Vistor clicks on a specific product", type: :feature, js: true do

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

  scenario "They are linked to the specific product details page" do
    visit root_path
    expect(page).to have_css 'article.product', count: 10

    page.first('article.product').find('h4').click

    expect(page).to have_css 'article.product-detail'
  end

end