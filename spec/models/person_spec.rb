require "rails_helper"

RSpec.describe Person, type: :model do
  subject { described_class.new }

  describe "associations" do
    it "is expected to belong to company" do
      if subject.employee?
        expect(subject).to respond_to(:company)
      else
        expect(subject.company).to be_nil
      end
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }

    it "is invalid for an employee without a company" do
      employee = build(:employee, company: nil)
      expect(employee).not_to be_valid
      expect(employee.errors[:company]).to include("can't be blank")
    end

    it "is valid for a consultant without a company" do
      consultant = build(:consultant, company: nil)
      expect(consultant).to be_valid
    end
  end
end
