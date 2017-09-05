require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = create(:company, name: "ESPN")
    job = create(:job, title: "Engineering", company_id: company.id)
    visit company_jobs_path(company)

    within(".job_#{job.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Engineering")
  end
end
