require "rails_helper"

RSpec.describe Person, type: :model do
  subject { described_class.new }

  describe "associations" do
    it { is_expected.to belong_to(:company).optional }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:contractor) }
  end
end
