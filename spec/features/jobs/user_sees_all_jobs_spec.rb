require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = create(:company, name: "ESPN")
    create(:job, title: "Developer", company_id: company.id)
    create(:job, title: "QA Analyst", company_id: company.id)

    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end
end
