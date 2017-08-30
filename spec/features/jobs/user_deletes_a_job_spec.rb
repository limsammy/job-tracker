require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "ESPN")
    job = company.jobs.create!(title: "Engineering", description: "What a great position!", level_of_interest: rand(100), city: "Portland")
    visit company_jobs_path

    within(".job_#{job.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Engineering from ESPN was successfully deleted!")
  end
end
