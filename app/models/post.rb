class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_votes

  validates :title, presence: true
  validates :image,  presence: true
  validates :body, length: {minimum: 10}

end

