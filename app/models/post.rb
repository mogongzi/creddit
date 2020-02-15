class Post < ApplicationRecord
  belongs_to :account
  belongs_to :community
  has_many :comments
  validates_presence_of :title, :body, :account_id, :community_id

  def score
    if upvotes.positive? || downvotes.positive?
      upvotes.positive? ? (upvotes - downvotes) : (downvotes * -1)
    else
      0
    end
  end
end
