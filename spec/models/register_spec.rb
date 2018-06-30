require 'rails_helper'

describe Register, 'validation' do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:blood_type) }
  it { should validate_presence_of(:cancer_type) }
end

describe Register, 'association' do
  it { should belong_to(:user) }
end

describe Register, 'column_specification' do
  it { should have_db_column(:user_id).of_type(:integer).with_options(presence: true) }
  it { should have_db_column(:blood_type).of_type(:string).with_options(presence: true) }
  it { should have_db_column(:cancer_type).of_type(:string).with_options(presence: true) }
end

# describe Register, :type => :model do

#  it "should belong to user" do
#    expect(create(:register)).to be_valid
#  end
RSpec.describe Register, type: :model do
  user = User.create(name: 'Rick Sanchez', email: 'rick@rickmail.com', age: 137, password:'wubbalubbadubdub')
  register =  user.build_register(blood_type: 'a+', cancer_type:'tipo01', local:'cidadel', blood_donation:true, bone_donation:true)

  it 'send an email' do
    expect { UserMailer.with(user: user).info_email(user).deliver
    }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
