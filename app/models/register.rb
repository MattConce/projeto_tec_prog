class Register < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  VALID_BTYPE = /(\A(a|b|ab|o)[+|-]\z)/i
  validates :blood_type, presence: true, format: {with: VALID_BTYPE}
  validates :cancer_type, presence: true
  validates :blood_donation,
           presence: {if: -> {'blood_donation.nil?'}}
  validates :bone_donation,
           presence: {if: -> {'bone_donation.nil?' }}

  validates :local, presence: true
  before_save { blood_type.upcase! }
end
