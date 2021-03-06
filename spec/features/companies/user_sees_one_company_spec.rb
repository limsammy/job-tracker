require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = create(:company, name: "ESPN")
    job = create(:job, title: "Developer", company_id: company.id)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end
end
