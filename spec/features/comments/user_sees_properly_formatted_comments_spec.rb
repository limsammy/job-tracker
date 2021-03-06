describe "Order of multiple comments" do
  scenario "user creates several comments and sees the most recent one first" do
    company = create(:company)
    job = create(:job, company_id: company.id)
    visit company_job_path(job.company, job)
    fill_in "comment[body]", with: "First Comment Text"
    click_on "Submit"
    fill_in "comment[body]", with: "More Recent Comment Text"
    click_on "Submit"
    expect("More Recent Comment Text").to appear_in_page_before("First Comment Text")
  end
end
