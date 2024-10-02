FactoryBot.define do 
  factory :user do
    username { "test" }
    email { "test@gmail.com" }
    password { "123456" }
  end

  factory :post do
    description { "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus atque quia nulla a odit hic? Cumque voluptatum sint voluptate. Minima natus quam nobis pariatur ipsa magnam deleniti voluptates, sed maiores?" }
    association :user
  end

  factory :comment do 
    description { "Lorem ipsum dolor sit, amet consectetur adipisicing elit." }
    association :post
    association :user
  end

  factory :like do 
    association :post
    association :user
  end

  factory :feed do 
    title { "Main Feed" }
  end
end