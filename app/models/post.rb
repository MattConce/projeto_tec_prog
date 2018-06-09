class Post < ApplicationRecord
  #attr_accessor :body, :title, :user
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 500}
end
