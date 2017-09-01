require 'rails_helper'

describe Job do
  # describe "validations" do
  #   context "invalid attributes" do
  #     it "is invalid without a title" do
  #       job = create(:job, title: "")
  #       expect(job).to be_invalid
  #     end

  #     it "is invalid without a level of interest" do
  #       job = create(:job, level_of_interest: "")
  #       expect(job).to be_invalid
  #     end

  #     it "is invalid without a city" do
  #       job = create(:job, city: "")
  #       expect(job).to be_invalid
  #     end
  #   end

  #   context "valid attributes" do
  #     it "is valid with a title, level of interest, and company" do
  #       company = create :company
  #       job = create(:job, company: company)
  #       expect(job).to be_valid
  #     end
  #   end
  # end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end
end
