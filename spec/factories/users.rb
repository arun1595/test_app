FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@gmail.com"
    end

    first_name 'John'
    password 'weakpassword'
    password_confirmation 'weakpassword'
    street 'Warren Ave'
    country 'United States of America'
    zip_code '48228'

    factory :invalid_user do
      email ''
    end
  end
end
