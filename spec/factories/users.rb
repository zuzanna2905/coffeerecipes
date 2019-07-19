FactoryBot.define do
  factory :user do
    id { 1 }
    name {'Jon'}
    email {'jon@gmail.com'}
    password {'jon123'}
    password_confirmation {'jon123'}
  end
end