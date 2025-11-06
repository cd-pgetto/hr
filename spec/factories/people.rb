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
FactoryBot.define do
  factory :person do
    name { "John Doe" }
    email { "person@example.com" }

    factory :employee do
      email { "employee@example.com" }
    end

    factory :consultant do
      email { "consultant@example.com" }
    end
  end
end
