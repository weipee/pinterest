class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comment_vote

  validates :content, length: {minimum: 10}
end
