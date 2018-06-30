class Register < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  VALID_BTYPE = /(\A(a|b|ab|o)[+|-]\z)/i
  validates :blood_type, presence: true, format: {with: VALID_BTYPE}
  validates :cancer_type, presence: true
  validates_inclusion_of :blood_donation,
           :in => [true, false]
  validates_inclusion_of :bone_donation,
           :in => [true, false]

  validates :local, presence: true
  before_save { blood_type.upcase! }

end
