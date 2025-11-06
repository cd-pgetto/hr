# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  has_many :employments, dependent: :destroy
  has_many :people, through: :employments

  has_many :employee_employments, -> { where(employment_type: :employee) }, class_name: "Employment"
  has_many :employees, through: :employee_employments, source: :person

  has_many :contractor_employments, -> { where(employment_type: :contractor) }, class_name: "Employment"
  has_many :contractors, through: :contractor_employments, source: :person

  validates :name, presence: true
end
