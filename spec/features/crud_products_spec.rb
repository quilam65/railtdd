require 'rails_helper'

describe 'Product can CRUD', type: :feature do
  include Warden::Test::Helpers

   let(:user)   { create(:user) }

   before do
       # Sign the User in
       Warden.test_mode!
       login_as(user)
   end
  let!(:category) { create(:category) }
  it 'can create a product' do
    visit '/en'
    visit '/products'
    expect(page).to have_link 'Create a product'
    click_on 'Create a product'
    expect(page).to have_content 'Create a product'
    fill_in 'product[title]', with: 'Jquery book'
    fill_in 'product[description]', with: 'description good'
    fill_in 'product[price]', with: 12
    fill_in 'product[category_id]', with: category.id
    click_on 'Create a product'
    expect(page).to have_content 'jquery book'
  end


  context 'edit' do
    let!(:product) { create(:product, title: 'ABD') }
    it 'can edit a product' do
      visit '/en'
      visit '/products'
      click_on 'Edit'
      expect(page).to have_content 'Edit a product'
      fill_in 'product[title]', with: 'Jquery book2'
      click_on 'Submit'
      expect(page).to have_content 'jquery book2'
    end
  end

  context 'show' do
    let!(:product) { create(:product, title: 'show') }
    it 'can show a product' do
      visit '/en'
      visit '/products'
      click_on product.title
      expect(page).to have_content product.title
    end
  end


  context 'delete' do
    let!(:product) { create(:product, title: 'qui lam') }
    it 'can delete a product' do
      visit '/en'
      visit '/products'
      expect(page).to have_content product.title
      click_on 'Delete'
      expect(page).to have_content 'Delete success!'
    end
  end


end
