FactoryBot.define do
  factory :user do
    name {'Jon'}
    email {'jon@gmail.com'}
    password {'jon123'}
    password_confirmation {'jon123'}
    trait :admin do
      admin {true}
    end
  end

  factory :random_user, class: User do 
    name { Faker::Name.first_name }
    email { Faker::Internet.safe_email }
    password {'jon123'}
    password_confirmation {'jon123'}
    trait :admin do
      admin {true}
    end
  end
end