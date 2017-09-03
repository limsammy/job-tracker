class Job < ApplicationRecord
  validates :title, :level_of_interest, :description, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.jobs_by_interest
    group(:level_of_interest).count
  end

  def self.locations_and_jobs
    group(:city).count
  end
end
