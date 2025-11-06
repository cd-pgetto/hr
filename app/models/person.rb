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
class Person < ApplicationRecord
  has_many :employments, dependent: :destroy
  has_many :companies, through: :employments

  has_one :employee_employment, -> { where(employment_type: :employee) }, class_name: "Employment"
  has_one :employer, through: :employee_employment, source: :company

  has_many :contractor_employments, -> { where(employment_type: :contractor) }, class_name: "Employment"
  has_many :clients, through: :contractor_employments, source: :company

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  normalizes :email, with: ->(value) { value.strip.downcase }
end
