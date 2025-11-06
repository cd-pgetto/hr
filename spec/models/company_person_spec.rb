require "rails_helper"

RSpec.describe CompanyPerson, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to belong_to(:person) }
  end

  describe "validations" do
    let(:company) { create(:company) }
    let(:employee) { create(:employee) }

    subject {}
  end
end
