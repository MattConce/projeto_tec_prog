class Register < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :blood_type, presence: true
  validates :cancer_type, presence: true
end
