FactoryBot.define do
  factory :user do
    email { 'jkowalski@gmail.com' }
    first_name { 'Jan' }
    last_name  { 'Kowalski' }
    height { 180 }
    preferred_weight { 85 }
  end
end