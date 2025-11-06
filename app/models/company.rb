class Company < ApplicationRecord
  has_many :employees, class_name: "Person"

  validates :name, presence: true
end
