require 'rails_helper'

describe Post, 'validation' do
  it { should validate_presence_of(:user_id) }

  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).is_at_most(500) }
end

describe Post, 'association' do
  it { should belong_to(:user) }
end

describe Post, 'column_specification' do
  it { should have_db_column(:user_id).of_type(:integer).with_options(presence: true) }
  it { should have_db_column(:body).of_type(:text).with_options(length: { maximum: 500 })}
end
