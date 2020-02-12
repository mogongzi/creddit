class Community < ApplicationRecord
  belongs_to :account
  has_many :subscriptions
  has_many :posts
  has_many :accounts, through: :subscriptions

  validates_presence_of :url, :name, :rules
end
