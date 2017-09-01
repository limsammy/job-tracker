class Job < ApplicationRecord
  validates :title, :level_of_interest, :description, :city, presence: true
  belongs_to :company
  belongs_to :category
end
