# == Schema Information
#
# Table name: employments
#
#  id              :bigint           not null, primary key
#  employment_type :enum             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint           not null
#  person_id       :bigint           not null
#
# Indexes
#
#  index_employments_on_company_id                     (company_id)
#  index_employments_on_company_id_and_person_id       (company_id,person_id) UNIQUE
#  index_employments_on_person_id                      (person_id)
#  index_employments_on_person_id_and_employment_type  (person_id,employment_type)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (person_id => people.id)
#
require "rails_helper"

RSpec.describe Employment, type: :model do
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
