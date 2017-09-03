describe "Creating a comment" do
  scenario "user fills out a form for creating a comment" do
    company = create(:company)
    job = create(:job, company_id: company.id)
    visit company_job_path(job.company, job)
    fill_in "comment[content]", with: "This Is Comment Text"
    click_on "Create Comment"
    expect(page).to have_current_path(company_job_path(job.company, job))
    expect(page).to have_content("This Is Comment Text")
  end
end
