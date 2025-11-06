class Person < ApplicationRecord
  belongs_to :company, optional: true

  validates :name, presence: true
  validates :email, presence: true
  validates :contractor, presence: true
end
