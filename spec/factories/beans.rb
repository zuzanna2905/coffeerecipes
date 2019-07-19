FactoryBot.define do
  factory :bean do
    roaster
    name { 'Peru El Diamante' }
    add_attribute(:method) { 'Washed' }
    country { 'Peru' }
    roast { 'light' }
    description { 'Varietal: Caturra' }
  end
end