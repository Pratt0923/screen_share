class ChatRoom < ApplicationRecord
  belongs_to :user
  belongs_to :categoriesproject
  has_many :messages, dependent: :destroy
  validates_presence_of :github_url
  validates_presence_of :description
end
