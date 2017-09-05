class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_three_companies
    companies_with_interest = Company.all.map do |company|
      [company, company.average_level_of_interest]
    end
    companies_by_interest = companies_with_interest.sort_by! do |company_and_interest|
      company_and_interest.last
    end
    top_three_companies_by_interest = companies_by_interest.reverse.take(3)
  end

  def average_level_of_interest
    total_interest = jobs.reduce(0) { |memo, job| memo + job.level_of_interest }
    average_level_of_interest = total_interest / jobs.count
    average_level_of_interest.round(2)
  end
end
