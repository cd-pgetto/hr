# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Company, type: :model do
  # subject { described_class.new }

  describe "associations" do
    it { is_expected.to have_many(:employees).class_name("Person") }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
