namespace :bootstrap do

  desc "Add default user with password: use password=mypassword to set the password, and email=my@email.com for email"
  task :default_user => :environment do
    user = User.create(
      :name => "Administrator",
      :login => 'admin',
      :password => ENV['password'],
      :email => ENV['email'])

    user.password_confirmation = ENV['password']
    # Admin stuff cannot be mass assigned.
    user.is_admin = true

    if user.valid?
      user.activate!
      puts "Admin user was created successfully."
    else
      puts "Admin user not created, the following errors occured:"
      user.errors.full_messages.each {|msg| puts msg }
      puts
      puts "To add default user with password: use password=mypassword to set the password, and email=my@email.com for email"
    end
  end

  desc "Remove admin user"
  task :remove_default_user => :environment do
    user = User.find_by_login('admin')
    if user
      user.destroy
    end
  end

  desc "Revert all bootstrapping tasks"
  task :clean => [:remove_default_user]

  desc "Run all bootstrapping tasks"
  task :all => [:default_user]

end