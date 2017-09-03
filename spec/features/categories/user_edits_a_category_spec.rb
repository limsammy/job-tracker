require 'rails_helper'

describe "Editing categories" do
  scenario "user edits a category" do
    category = create(:category, title: "CategoryTitle")
    visit edit_category_path(category)
    fill_in "Title", with: "UpdatedTitle"
    click_on "Submit"
    expect(page).to have_content("UpdatedTitle")
    expect(page).to have_current_path(category_path(category))
  end

  scenario "user tries to edit a category that would be a duplicate" do
    category_1 = create(:category, title: "Category1Title")
    category_2 = create(:category)
    visit edit_category_path(category_2)
    fill_in "Title", with: "Category1Title"
    click_on "Submit"
    expect(page).to have_current_path(edit_category_path(category_2))
  end
end
