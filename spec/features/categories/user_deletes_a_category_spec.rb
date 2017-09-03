require 'rails_helper'

describe "Deleting a category" do
  scenario "user deletes a category" do
    category = create(:category, title: "DeleteMe")
    visit categories_path
    within(".category_#{category.id}") do
      click_on "Delete"
    end
    expect(page).to have_current_path(categories_path)
    expect(page).to have_content("Category #{category.title} was deleted!")
    visit categories_path
    expect(page).not_to have_content("DeleteMe")
  end
end
