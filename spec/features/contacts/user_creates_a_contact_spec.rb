describe "Creating a contact" do
  scenario "user fills out a form to create a contact" do
    company = create(:company)
    visit company_path(company)
    fill_in "contact[full_name]", with: "John Doe"
    fill_in "contact[position]", with: "General Manager"
    fill_in "contact[email]", with: "john.doe@gmail.com"
    click_on "Submit"
    expect(page).to have_current_path(company_path(company))
    expect(page).to have_content("John Doe")
  end
end