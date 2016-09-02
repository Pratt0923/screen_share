class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  validates_presence_of :github_url
  validates_presence_of :description
end
