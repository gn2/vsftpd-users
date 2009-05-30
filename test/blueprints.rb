require 'faker'

Sham.define do
  name        { Faker::Name.name }
  login       { Faker::Internet::user_name }
  email       { Faker::Internet::email }
end

User.blueprint do
  name        { Sham.name }
  login       { Sham.login }
  email       { Sham.email } 
end

User.blueprint(:with_password) do
  password { "123456abcDE" } 
  password_confirmation { "123456abcDE" } 
end