FactoryBot.define do
  factory :recipe do
    user
    bean
    roaster
    temperature { 90 }
    water {500}
    dose {30} 
    add_attribute(:method) { 'V60' }
    grinder { 'Comandante' }
    clicks {15}
    time {Time.now}
    description {'non'}
    rate {5}
    likes {0}
  end
end