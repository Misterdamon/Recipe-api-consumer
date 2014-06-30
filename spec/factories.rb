require "faker"
FactoryGirl.define do
  sequence(:title) {|n| "recipe #{n}"}
  sequence(:content) {|n| Faker::Lorem::paragraph + "#{n}"}
  sequence(:body) {|n| Faker::Lorem::paragraph + "#{n}"}

  factory :recipe do
    title
    content
    votes 0
  end

  factory :comment do
    body
  end

end