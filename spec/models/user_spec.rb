require "rails_helper"

describe User, 'validation' do
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(50) }

  it { should validate_presence_of(:email) }
  it { should validate_length_of(:email).is_at_most(255) }
  # it { should validate_uniqueness_of(:email).case_insensitive }

end

describe User, 'association' do
  it { should have_secure_password }
  it { should have_many(:posts) }
  it { should have_one(:register) }
end

describe User, 'column_specification' do
  #it { should have_db_column(:password).with_options(presence:{ on: :create }, length: {minimum: 6})}
  it { should have_db_column(:name).with_options(length: {maximum: 50})}
  it { should have_db_column(:email).with_options(presence: true, length: {maximum:255}, uniqueness: {case_sensitive: false})}
end

describe User, :type => :model do

  before(:all) do
    @user1 = create(:user)
    # @user1 = build_stubbed(:user)
    # @user1 = build(:user)
  end

  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end

  it "is not valid without a password" do 
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without a username" do 
    user2 = build(:user, name: nil)
    expect(user2).to_not be_valid
  end

  it "has a unique username" do
    user2 = build(:user, name: @user1.name)
    expect(user2).to_not be_valid
  end

  it "has a unique email" do
    user2 = build(:user, email: @user1.email)
    expect(user2).to_not be_valid
  end

  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end

  it "has case-insensitive email" do
    user2 = build(:user, email: "CAIXAALTA@AlTeRnAdA.cOm.Br")
    expect(user2.email).to match(/caixaalta@alternada.com.br/i)
  end

end
