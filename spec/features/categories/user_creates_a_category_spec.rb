require 'rails_helper'

describe "Creating a category" do
  scenario "a user can create a category" do
    visit new_category_path
    fill_in "Title", with: "CategoryTitle"
    click_on "Create Category"

    expect(page).to have_content "CategoryTitle"
  end

  scenario "a user tries to create a duplicate category" do
    visit new_category_path
    fill_in "Title", with: "CategoryTitle"
    click_on "Create Category"

    visit new_category_path
    fill_in "Title", with: "CategoryTitle"
    click_on "Create Category"

    expect(page).to have_content("That category has already been created!")
    expect(page).to have_current_path(new_category_path)
  end
end
