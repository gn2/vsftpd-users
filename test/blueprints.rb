require 'faker'

Sham.define do
  name        { Faker::Name.name }
  description { Faker::Lorem.paragraphs }
  login       { Faker::Internet::user_name }
  email       { Faker::Internet::email }
  password    { Faker::Address::uk_postcode }
end

Sham.ip_address do
  String("#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}")
end


User.blueprint do
  name                  { Sham.name }
  login                 { Sham.login }
  email                 { Sham.email }
  password              { Sham.password } 
  password_confirmation { password }
end

User.blueprint(:active) do
  state { "active" }
end


Ftpuser.blueprint do
  login { Sham.login }
  password { "123456abcDE" } 
  password_confirmation { "123456abcDE" }
  server
  group
end

Group.blueprint do
  name { Sham.name }
  description { Sham.description }
end


Server.blueprint do
  name { Sham.name }
  description { Sham.description }
  ip_address { Sham.ip_address }
end