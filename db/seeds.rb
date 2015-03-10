require 'faker'

class Seed

  def self.seed_users
    10.times do |x|
      User.create(username: Faker::Name.name, password: "123", email: Faker::Internet.email)
    end
  end

  def self.seed_posts
    10.times do |x|
      Post.create(title: Faker::Lorem.sentence, body:Faker::Lorem.paragraph, user_id: rand(1..10))
    end
  end


  def self.seed_comments
    100.times do |x|
      Comment.create(content: Faker::Lorem.paragraph, post_id: rand(1..10), user_id: rand(1..10))
    end
  end
end

Seed.seed_users
Seed.seed_posts
Seed.seed_comments