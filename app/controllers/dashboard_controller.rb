class DashboardController < ApplicationController
  def dashboard
    @jobs_by_interest = Job.jobs_by_interest
    @top_three_companies = Company.top_three_companies
    @job_count_by_location = Job.locations_and_jobs
  end
end
