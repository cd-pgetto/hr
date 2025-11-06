require "rails_helper"

RSpec.describe Company, type: :model do
  subject { described_class.new }

  describe "associations" do
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
