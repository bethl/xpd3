namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    #make_microposts
    #make_relationships
  end
end


def make_users
  admin = User.create!(:email => "it@excelsiorcarpetone.com",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
  
  admin.persons.create(:first_name => "greg", :last_name => "Thomas", :email => admin.email)
  
  
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(:email => email,
                 :password => password,
                 :password_confirmation => password).persons.create(:first_name => name, :last_name => name, :email => email)
   
    
  end
end



def make_microposts
  User.all(:limit => 6).each do |user|
    50.times do
      content = Faker::Lorem.sentence(5)
      user.microposts.create!(:content => content)
    end
  end
end


def make_relationships
  users = User.all
  user  = users.first
  following = users[1..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }   # note user = users.first  
  followers.each { |follower| follower.follow!(user) }   # have a bunch of users follow User[0]
end
