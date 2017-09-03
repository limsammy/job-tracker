class Category < ApplicationRecord
  validates :title, uniqueness: true
  has_many :jobs
end
