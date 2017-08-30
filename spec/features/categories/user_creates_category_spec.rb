require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Engineering", description: "What a great position!", level_of_interest: rand(100), city: "Portland")
    visit company_job_categories(company)

    fill_in "category[title]", with: "Dev"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
