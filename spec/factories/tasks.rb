FactoryBot.define do
  factory :task do
    title { "Call the plumber" }
    note { "555-5555-9000" }
    due_date { DateTime.new(2023, 2, 14, 9, 15, 0) }
    completed_at { nil }
    effort_level { 2 }

    trait :completed do
      completed_at { DateTime.new(2023, 3, 14, 9, 15, 0) }
    end
  end
end