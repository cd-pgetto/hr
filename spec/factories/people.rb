FactoryBot.define do
  factory :person do
    employee { true }
    name { "John Doe" }
    email { "person@example.com" }
    company { nil }

    factory :employee do
      employee { true }
      email { "employee@example.com" }
      company { nil }
    end

    factory :consultant do
      employee { false }
      email { "consultant@example.com" }
      company { nil }
    end
  end
end
