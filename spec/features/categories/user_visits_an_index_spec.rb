require 'rails_helper'

describe "Categories index page" do
  scenario "user visits the index page" do
    category_1 = create(:category, title: "Category1Title")
    category_2 = create(:category, title: "Category2Title")

    visit categories_path
    expect(page).to have_content("Category1Title")
    expect(page).to have_content("Category2Title")
    expect(page).to have_link("Delete", href: category_path(category_1))
    expect(page).to have_link("Delete", href: category_path(category_2))

    click_on "Category1Title"
    expect(page).to have_current_path("/categories/#{category_1.id}")

    click_on "All Categories"
    expect(page).to have_current_path(categories_path)

    within(".category_#{category_1.id}") do
      click_on "Edit"
      expect(page).to have_current_path("/categories/#{category_1.id}/edit")
    end
  end
end
