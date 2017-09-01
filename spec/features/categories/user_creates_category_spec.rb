require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new job" do
    company = create :company
    job = create(:job, company_id: company.id)
    visit new_company_job_category_path(job)

    fill_in "category[title]", with: "Dev"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Dev")
  end
end
