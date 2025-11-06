# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  employee   :boolean          default(TRUE), not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_people_on_company_id  (company_id)
#  index_people_on_email       (email) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require "rails_helper"

RSpec.describe Person, type: :model do
  subject { described_class.new }

  describe "associations" do
    it { is_expected.to have_many(:employments).dependent(:destroy) }
    it { is_expected.to have_many(:companies).through(:employments) }
    it { is_expected.to have_one(:employee_employment).class_name("Employment").conditions(employment_type: :employee) }
    it { is_expected.to have_one(:employer).through(:employee_employment).source(:company) }
    it { is_expected.to have_many(:contractor_employments).class_name("Employment").conditions(employment_type: :contractor) }
    it { is_expected.to have_many(:clients).through(:contractor_employments).source(:company) }
  end

  describe "validations" do
    subject { build(:person) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
end
